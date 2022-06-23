# Geoserver (Jetty)
## Just create dockerfile becuz i'm so lazy to install it.



ฺBefore build image download geoserver with your desire version from sourceforge 
```sh
https://sourceforge.net/projects/geoserver/files/GeoServer/2.21.0/geoserver-2.21.0-bin.zip
or
https://sourceforge.net/projects/geoserver/files/GeoServer/<specific-version>/geoserver-<specific-version>-bin.zip
```

and place zip file at root (same place as Dockerfile)


Build image via
```sh
docker build -t <imagename>:<tag> .
```

Start container via
```sh
docker run --name <container_name> -p 8080:8080 -e GEOSERVER_HOME=/usr/share/geoserver --link=<db_container_name>:<new_connection_name> -d <image_name>:<tag>
```