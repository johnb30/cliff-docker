# cliff-docker

A Docker image for the [CLIFF](http://cliff.mediameter.org/) 2.1.1 geolocation software. 

Use
---

**Note: CLAVIN, and by extension CLIFF, is very memory hungry due to the
geonames index. To properly run, a minimum of 4GB of RAM is necessary. Any less
and you'll experience errors.**

Build using

```
docker build -t cliff:2.1.1 .
```

It is setup to use the default port of `8080`. Run using

```
docker run -p "8080:8080" -d cliff:2.1.1
```

The API endpoint for CLIFF is `/CLIFF-2.1.1/parse/text`

Acknowledgements
-----------------

This pulls heavily from Andy Halterman's [CLIFF-up](https://github.com/ahalterman/CLIFF-up)
Vagrant box. You can see his repo for more examples of how to make use of
CLIFF.
