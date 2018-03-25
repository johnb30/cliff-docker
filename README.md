# cliff-docker

A Docker image for the [CLIFF](http://cliff.mediameter.org/) geolocation software. 

Use
---

**Note: CLAVIN, and by extension CLIFF, is very memory hungry due to the
geonames index. To properly run, a minimum of 4GB of RAM is necessary. Any less
and you'll experience errors.**

This docker image uses a build and release workflow. The Lucene index is built
using the `build_server` image. The index is then copied to the host and can be
mounted as a voulme to the actual CLIFF server container.

Build the index with:
```
make buildindex
```
This step bulds the index and copis it to the host using the
`HOST_INDEX_LOCATION` variable. The default location is
`/etc/cliff2/IndexDirectory`.

Build the server with:
```
make buildserver
```
The CLIFF version is defined by `CLIFF_VERSION` and defaults to `2.3.0`.

Run the server with:
```
make run
```
This command mounts the index from the host to a Docker volume and starts the
container, running cliff on the port defined by `CLIFF_PORT`. The default is
`8080`.

The API endpoint for CLIFF is `/CLIFF-2.3.0/parse/text`.

Acknowledgements
-----------------

This pulls heavily from Andy Halterman's [CLIFF-up](https://github.com/ahalterman/CLIFF-up)
Vagrant box. You can see his repo for more examples of how to make use of
CLIFF.
