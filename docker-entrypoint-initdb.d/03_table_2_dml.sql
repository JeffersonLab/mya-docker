-- channel2 is a scalar int type with enum_strings

-- hstmya00: select * from channels where name = 'IGL1I00BEAMODE';
-- name and host modified
INSERT INTO `channels` VALUES (2,'channel2',3,NULL,1,NULL,1,1,0,'mya',6199944484738826240,NULL);

-- hstmya00: chan_id = 15170
INSERT INTO `metadata` VALUES (2,'enum_strings','2007-02-05 17:47:39','BEAM SYNC ONLY\0PULSE MODE VL\0TUNE MODE\0CW MODE (DC)\0EXPERT MODE\0\0'),(2,'enum_strings','2016-08-12 13:00:49','BEAM SYNC ONLY\0PULSE MODE VL\0TUNE MODE\0CW MODE (DC)\0USER MODE\0\0');

-- hstmya01: mysqldump -t -u myapi -p archive table_15170 --single-transaction --compact --where="time between 420257825449574400 and 420281018272972800" > /tmp/dump.sql
-- Range maps to Aug 12 2019 midnight -> 24 hours
INSERT INTO `table_2` VALUES (420258533090053905,0,0),(420258537215011914,0,3),(420259018953478939,0,0),(420259028027034530,0,3),(420259150485868574,0,0),(420259155152619323,0,3),(420259158807815302,0,0),(420259164838664973,0,3),(420259365499916341,0,0),(420259370967051576,0,3),(420260008934905789,0,0),(420260012433514425,0,3),(420260059666063154,0,0),(420260066667754352,0,3),(420260317630605887,0,0),(420260322440074281,0,3),(420260351722783922,0,0),(420260355122966229,0,3),(420260572373891480,0,0),(420260576131987713,0,3),(420260577742600385,0,0),(420260580077988759,0,3),(420260582842873845,0,0),(420260590829286789,0,3),(420260608076706311,0,0),(420260612147977231,0,3),(420261027370886563,0,0),(420261031388470393,0,3),(420261354589053019,0,0),(420261360360831060,0,3),(420262186193654338,0,0),(420262189562519176,0,3),(420262381615445519,0,0),(420262384841144786,0,3),(420262844661377276,0,0),(420262849640854785,0,3),(420262995521583656,0,0),(420262998823339633,0,3),(420263883767232570,0,0),(420263891758089427,0,3),(420263905019231659,0,0),(420263905502415460,0,3),(420263918763126456,0,0),(420263919246310258,0,3),(420263932507459681,0,0),(420263981100055459,0,3),(420264501700270081,0,0),(420264505529949100,0,3),(420264612831118991,0,0),(420264618101401566,0,3),(420264904346450795,0,0),(420264907567676138,0,3),(420265071850041933,0,0),(420265076350809565,0,3),(420265288474178702,0,0),(420265294608360311,0,3),(420265308607716915,0,0),(420265315591512416,0,3),(420265526574023816,0,0),(420265528900464341,0,3),(420265570598769360,0,0),(420265575305337501,0,3),(420265648174330149,0,0),(420265654710733241,0,3),(420265671260196444,0,0),(420265674212986342,0,3),(420265690319560816,0,0),(420265693272804056,0,3),(420265971907300137,0,0),(420265976162001944,0,3),(420265979423492604,0,0),(420265990707152852,0,3),(420265994183391868,0,0),(420265997704830559,0,3),(420266000626302988,0,0),(420266004062276688,0,3),(420266008146969380,0,0),(420266012043757260,0,3),(420266015659101196,0,0),(420266018379247041,0,3),(420266030155067186,0,0),(420266040530097145,0,3),(420266059683400453,0,0),(420266082000218391,0,2),(420266087914746035,0,1),(420266112566939403,0,3),(420266112570928289,0,1),(420266113318558650,0,0),(420266114419143976,0,2),(420266162850690128,0,0),(420266165418722554,0,1),(420266192746309537,0,0),(420266194862475631,0,2),(420266218865524793,0,0),(420266226905589970,0,2),(420266244054587506,0,1),(420266320610085383,0,0),(420266322068584636,0,2),(420266327312023666,0,0),(420266331110385217,0,2),(420266378839524997,0,0),(420266386696172990,0,3),(420266423410051010,0,0),(420266434215031437,0,3),(420266477366899735,0,0),(420266480543385837,0,3),(420266528366473817,0,0),(420266531744724104,0,3),(420266676278795339,0,0),(420266678551548776,0,3),(420266681379068799,0,0),(420266683723405021,0,3),(420266775329631052,0,0),(420266782447644275,0,3),(420266783798769350,0,0),(420266786590497980,0,3),(420266874112023290,0,0),(420266878975178773,0,3),(420266880822909421,0,0),(420266885145147958,0,3),(420266902030190855,0,0),(420266910257737252,0,3),(420266927800427826,0,0),(420266933004037179,0,3),(420267149793701108,0,0),(420267153632327975,0,3),(420267195965914602,0,0),(420267199719536912,0,3),(420267274346769102,0,0),(420267276547939753,0,3),(420267276762688110,0,0),(420267280095761555,0,3),(420267281326090679,0,0),(420267286064408337,0,3),(420267288305844305,0,0),(420267293432961310,0,2),(420267295822036773,0,0),(420267299351962878,0,2),(420267308693977921,0,3),(420267412053205799,0,0),(420267430038814856,0,3),(420269265314935434,0,0),(420269268523168607,0,3),(420269280347749971,0,0),(420269286191133708,0,3),(420269287327510426,0,0),(420269289443676519,0,3),(420269315514122767,0,0),(420269319464597736,0,3),(420269548781762883,0,0),(420269551756922401,0,3),(420269593880251456,0,0),(420269598743406940,0,3),(420269747957216474,0,0),(420269751957329953,0,3),(420270040551234988,0,0),(420270044931206670,0,3),(420270135038242970,0,0),(420270138242020998,0,3),(420270205102073063,0,0),(420270208139867519,0,3),(420270251269819414,0,0),(420270253618629561,0,3),(420270342808491448,0,0),(420270345721016029,0,3),(420270602647614899,0,0),(420270606491144145,0,3),(420270608016752259,0,0),(420270612155132040,0,3),(420270925038385372,0,0),(420270929423271003,0,3),(420271108644519431,0,0),(420271115874380757,0,3),(420271497872964068,0,0),(420271501980026381,0,3),(420271688999774641,0,0),(420271693540807590,0,3),(420272014607333352,0,0),(420272020651604795,0,3),(420272065611388083,0,0),(420272071848489098,0,3),(420272102920745955,0,0),(420272105824322688,0,3),(420272125738196846,0,0),(420272129567875865,0,3),(420272131912212087,0,0),(420272134333064881,0,3),(420272143455396096,0,0),(420272149114910067,0,3),(420272180231922772,0,0),(420272183614642052,0,3),(420272186674806128,0,0),(420272189269682099,0,3),(420272203318240646,0,0),(420272208794323729,0,3),(420272224789048471,0,0),(420272229526934080,0,3),(420272493491397988,0,0),(420272496940793460,0,3),(420272887014870781,0,0),(420272890674540685,0,3),(420272894531499161,0,0),(420272897175588296,0,3),(420273111424082134,0,0),(420273115141913050,0,3),(420273189272568913,0,0),(420273192900921348,0,3),(420273317852181590,0,0),(420273322939033278,0,3),(420273324294632276,0,0),(420273327981577020,0,3),(420273400528013017,0,0),(420273404008725957,0,3),(420273441599962273,0,0),(420273444780922299,0,3),(420273446163364842,0,0),(420273448731397268,0,3),(420273508974537019,0,0),(420273512195762362,0,3),(420273519712410066,0,0),(420273522951531106,0,3),(420273945717439687,0,0),(420273951882507080,0,3),(420273963430151534,0,0),(420273966526107003,0,3),(420273982757946890,0,0),(420273987335204336,0,3),(420274060337971179,0,0),(420274064181071971,0,3),(420274164757934315,0,0),(420274177352030622,0,3),(420274293874414602,0,0),(420274297417762479,0,3),(420274300853736178,0,0),(420274304795263300,0,3),(420274308369928646,0,0),(420274312915881769,0,3),(420274316960309144,0,0),(420274323219328943,0,3),(420274339504855591,0,0),(420274343151519003,0,3),(420274347289898784,0,0),(420274351701187935,0,3),(420274358027771827,0,0),(420274363145940983,0,3),(420274363933351622,0,0),(420274369642078758,0,2),(420274369838931418,0,0),(420274371780614472,0,2),(420274386571851923,0,3),(420274393193690680,0,0),(420274399730093772,0,3),(420274402857366709,0,0),(420274411590918574,0,3),(420274445539939693,0,0),(420274452635583296,0,3),(420274465400107368,0,0),(420274469305843096,0,3),(420274483385993028,0,0),(420274488083820144,0,3),(420274519894272959,0,0),(420274523786586915,0,3),(420274536000835667,0,0),(420274540183954689,0,3),(420274541369544573,0,0),(420274545311071694,0,3),(420274556670819180,0,0),(420274562504816191,0,3),(420274563381705312,0,0),(420274566003424827,0,3),(420274639346910453,0,0),(420274641919416804,0,3),(420274658674456827,0,0),(420274668768064934,0,3),(420274686592610358,0,0),(420274692668199269,0,3),(420274705915928843,0,0),(420274709405589631,0,3),(420274715848497906,0,0),(420274720036090852,0,3),(420274727928531687,0,0),(420274730952904370,0,3),(420274735713159600,0,0),(420274751730252312,0,3),(420274768731575502,0,0),(420274772789424649,0,3),(420274777590400016,0,0),(420274783397553482,0,3),(420274785106592484,0,0),(420274788806527704,0,3),(420274847917751364,0,0),(420274851577421268,0,3),(420274861608391976,0,0),(420274863992993515,0,3),(420274867245536326,0,0),(420274870717301419,0,3),(420274872077374341,0,0),(420274876068577724,0,3),(420274895700576519,0,0),(420274900957437322,0,3),(420274930061176626,0,0),(420274934611157423,0,3),(420274947241488036,0,0),(420274951625933642,0,3),(420274964954197615,0,0),(420274969142230025,0,3),(420274971933958656,0,0),(420274975803902991,0,3),(420274989382685375,0,0),(420274994460589215,0,3),(420274995825136062,0,0),(420275013032282979,0,3),(420275086554470671,0,0),(420275094271989722,0,3),(420275193662814958,0,0),(420275197475032481,0,3),(420275254863368389,0,0),(420275261910245085,0,3),(420275348813919182,0,0),(420275353739709602,0,3),(420275485447016305,0,0),(420275489768826974,0,3),(420275696170062289,0,0),(420275699784992952,0,3),(420275737505541375,0,0),(420275740628340389,0,3),(420276494223222933,0,0),(420276497654722708,0,3),(420276675417458524,0,0),(420276678876230792,0,3),(420277071894129617,0,0),(420277074793232426,0,3),(420277094438657419,0,0),(420277097069799071,0,3),(420277195641899879,0,0),(420277199288148011,0,3),(420277291739959765,0,0),(420277295149089920,0,3),(420277316700413661,0,0),(420277320114017740,0,3),(420277437768311636,0,0),(420277441839582556,0,3),(420277542456483394,0,0),(420277545789556840,0,3),(420278666922619036,0,0),(420278684617464438,0,3),(420278742082248295,0,0),(420278745030564269,0,3),(420278763289088262,0,0),(420278766138977906,0,3),(420278958442412319,0,0),(420278968965511109,0,3),(420279205665037899,0,0),(420279209074168054,0,3),(420279244589074367,0,0),(420279248217426802,0,3),(420279329412388924,0,0),(420279332418865911,0,3),(420279910036158443,0,0),(420279913141061760,0,3),(420280026804620915,0,0),(420280032119642732,0,3),(420280039957957733,0,0),(420280042656171996,0,3),(420280309998086911,0,0),(420280313035881367,0,3),(420280504614581976,0,0),(420280527902247652,0,3);