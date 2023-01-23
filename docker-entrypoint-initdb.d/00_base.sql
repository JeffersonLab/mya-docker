CREATE TABLE `channels` (
                            `chan_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
                            `name` varchar(255) COLLATE latin1_general_cs NOT NULL,
                            `type` tinyint(3) unsigned NOT NULL,
                            `adel` varchar(255) COLLATE latin1_general_cs DEFAULT NULL,
                            `size` smallint(5) unsigned NOT NULL DEFAULT '1',
                            `clip` int(10) unsigned DEFAULT NULL,
                            `active` tinyint(4) NOT NULL DEFAULT '1',
                            `request` tinyint(4) NOT NULL DEFAULT '0',
                            `alert` tinyint(4) NOT NULL DEFAULT '0',
                            `host` varchar(255) COLLATE latin1_general_cs NOT NULL,
                            `backup` bigint(20) DEFAULT '0',
                            `ioc` varchar(255) COLLATE latin1_general_cs DEFAULT NULL,
                            PRIMARY KEY (`chan_id`),
                            UNIQUE KEY `name` (`name`),
                            KEY `host` (`host`(16)),
                            KEY `alert` (`alert`)
);

CREATE TABLE `metadata` (
                            `chan_id` int(10) unsigned NOT NULL,
                            `keyword` varchar(255) COLLATE latin1_general_cs NOT NULL,
                            `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                            `info` text COLLATE latin1_general_cs NOT NULL,
                            KEY `chan_id` (`chan_id`),
                            KEY `keyword` (`keyword`(16)),
                            CONSTRAINT `metadata_ibfk_1` FOREIGN KEY (`chan_id`) REFERENCES `channels` (`chan_id`) ON DELETE CASCADE
);

DELIMITER //
CREATE DEFINER=`myapi`@`localhost` PROCEDURE `sample`(in tab char(20), in points int, in t1 bigint, in t2 bigint, in get int)
    COMMENT ' get - Return the data as a result set (non zero)'
begin
    declare i int default 0;
    declare start, stop bigint;
    declare step double default (t2-t1) / points;  # Time span length.

    # Create a temporary table, identical to the passed history table, to hold the
    # results from the user specified table. Note a session scope user variable is used
    # because the 'prepare' feature does not work with procedure variables.
    drop temporary table if exists table_x;
    set @stmt = 'create temporary table table_x select * from ';
    set @stmt = concat(@stmt,tab,' where time=0');
    prepare p from @stmt;
    execute p;
    deallocate prepare p;

    # Create a dynamic SQL statement for selecting a row from the channel history table
    # and inserting it into the temporary table.
    set @insert = 'insert into table_x select * from ';
    set @insert = concat(@insert,tab,' where time>=? and time<? and (code&15)=0 limit 1');
    prepare p from @insert;

    # Create a dynamic SQL statement for getting the nearest inbound channel event prior
    # to a time bin.
    set @prior = 'select code,val1 into @code, @value from ';
    set @prior = concat(@prior,tab,' force index(primary) where time<? order by time desc limit 1');
    prepare q from @prior;

    # Iterate for each of the time bins contained within the overall requested time
    # range.
    while i < points do
            set @start = t1 + i * step;    # Begin time of span
            set @stop = @start + step;     # End time of span

            # Query for a single row, within one time bin, from the source table; putting it
            # in the temporary table.
            execute p using @start, @stop;

            # Was the time bin empty?  If so, there may be an inbound value that persisted
            # throughout the time span of the bin. If an inbound channel event exists and
            # is not a discontinuity, insert the inbound value into the temporary table.
            select row_count() into @count;
            if @count = 0 then
                set @code = 1;
                execute q using @start;
                if (@code&15)=0 then
                    insert into table_x values (@start,0,@value);
                end if;
            end if;

            set i = i + 1;
        end while;

    # Free resources for the prepared statements.
    deallocate prepare q;
    deallocate prepare p;

# Was an immediate return of values requested?
    if get != 0 then
        select * from table_x order by time;   # Return the accumulated results to the user.
        drop temporary table table_x;          # Get rid of the table.
    end if;
end;
//

CREATE DEFINER=`myapi`@`localhost` FUNCTION `STR_TO_MYA`(str char(64)) RETURNS bigint(17)
    COMMENT 'Return a MYA Timestamp given an ISO8901 string'
begin
    declare hi bigint(20) unsigned default 0;

    set time_zone = 'America/New_York';
    set hi=unix_timestamp(str);

return (hi << 28);
end;
//
DELIMITER ;