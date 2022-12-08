# mya-docker
Read-only MYA Docker container.

# Overview
The JLab EPICS archiver is named MYA, and this project provides a read-only instance in a container.  The container image leverages the [MariaDB](https://hub.docker.com/_/mariadb) image and adds the MYA schema with some example data.  The parts of MYA that monitor EPICS and write to the database are not included.  This container is useful for testing and developing MYA-dependent apps.
