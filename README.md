# mycontainer [![Docker](https://img.shields.io/docker/v/jeffersonlab/mycontainer?sort=semver&label=DockerHub)](https://hub.docker.com/r/jeffersonlab/mycontainer)
Read-only MYA Docker container.

---
- [Overview](https://github.com/JeffersonLab/mycontainer#overview)
- [Quick Start with Compose](https://github.com/JeffersonLab/mycontainer#quick-start-with-compose)
- [Install](https://github.com/JeffersonLab/mycontainer#install)
- [Configure](https://github.com/JeffersonLab/mycontainer#configure)
- [Build](https://github.com/JeffersonLab/mycontainer#build)
- [Release](https://github.com/JeffersonLab/mycontainer#release)
---

## Overview
The JLab [EPICS](https://epics-controls.org/) archiver is named MYA, and this project provides a read-only instance in a container.  The container image leverages the [MariaDB](https://hub.docker.com/_/mariadb) image and adds the MYA schema with some example data.  The parts of MYA that monitor EPICS and write to the database are not included.  This container is useful for testing and developing MYA-dependent apps.

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

You can mount an `.sql` file into the /docker-entrypoint-initdb.d/ directory to add additional data.  Some [files](https://github.com/JeffersonLab/mycontainer/tree/main/docker-entrypoint-initdb.d) already exist, so be careful not to overwrite or name your file starting with a number that forces it to be processed before the DDL is run. 

## Build
```
git clone https://github.com/JeffersonLab/mycontainer
cd mycontainer
docker build -t mycontainer .
```

## Release
1. Run docker build and tag release
2. Push to DockerHub
