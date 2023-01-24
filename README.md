# mycontainer [![Docker](https://img.shields.io/docker/v/jeffersonlab/mycontainer?sort=semver&label=DockerHub)](https://hub.docker.com/r/jeffersonlab/mycontainer)
Read-only MYA Docker container.

---
- [Overview](https://github.com/JeffersonLab/mycontainer#overview)
- [Quick Start with Compose](https://github.com/JeffersonLab/mycontainer#quick-start-with-compose)
- [Install](https://github.com/JeffersonLab/mycontainer#install)
- [Configure](https://github.com/JeffersonLab/mycontainer#configure)
- [Build](https://github.com/JeffersonLab/mycontainer#build)
- [Release](https://github.com/JeffersonLab/mycontainer#release)
- [See Also](https://github.com/JeffersonLab/mycontainer#see-also)
---

## Overview
The JLab [EPICS](https://epics-controls.org/) archiver is named MYA, and this project provides a read-only single node instance in a container.  The container image leverages the [MariaDB](https://hub.docker.com/_/mariadb) image and adds the MYA schema with some example data.  The parts of MYA that monitor EPICS and write to the database are not included.  This container is useful for testing and developing MYA-dependent apps.

## Quick Start with Compose
1. Grab project
```
git clone https://github.com/JeffersonLab/mycontainer
cd mycontainer
```
2. Launch [Compose](https://github.com/docker/compose)
```
docker compose up
```
3. Query for channels list
```
docker exec -it mya bash
mysql -u myapi -p -A archive
select * from channels;
```
Use password:  `password`

## Install
```
docker pull jeffersonlab/mycontainer
```

## Configure
The container is extended from the official [MariaDB](https://hub.docker.com/_/mariadb) image so all of those environment variables apply, especially the `MYSQL_PASSWORD` and `MYSQL_ROOT_PASSWORD`.

You can mount an `.sql` file into the /docker-entrypoint-initdb.d/ directory to add additional data.  Some [files](https://github.com/JeffersonLab/mycontainer/tree/main/docker-entrypoint-initdb.d) already exist, so be careful not to overwrite or name your file starting with a number that forces it to be processed before the base DDL is run.   Use a file mount and avoid an entire directory mount else you'll erase the `00_base.sql` file needed to setup the base DDL. 

## Build
```
git clone https://github.com/JeffersonLab/mycontainer
cd mycontainer
docker build -t mycontainer .
```

## Release
1. Create a new release on the GitHub [Releases](https://github.com/JeffersonLab/mycontainer/releases) (Enumerate changes and link issues). 
2. Build and publish a new Docker image [from the GitHub tag](https://gist.github.com/slominskir/a7da801e8259f5974c978f9c3091d52c#8-build-an-image-based-of-github-tag). GitHub is configured to do this automatically on git push of semver tag (typically part of GitHub release) or the [Publish to DockerHub](https://github.com/JeffersonLab/mycontainer/actions/workflows/docker-publish.yml) action can be manually triggered after selecting a tag.
3. Bump and commit quick start [image version](https://github.com/JeffersonLab/mycontainer/blob/main/docker-compose.override.yml)

## See Also
- [myquery](https://github.com/JeffersonLab/myquery)
- [softioc](https://github.com/JeffersonLab/softioc)
