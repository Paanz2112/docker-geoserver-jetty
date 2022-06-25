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

allow CORS origin by remove comment in web.xml locate in /usr/share/geoserver/webapps/geoserver/WEB-INF/web.xml
```sh
   <!-- Uncomment following filter to enable CORS in Jetty. Do not forget the second config block further down.
    <filter>
      <filter-name>cross-origin</filter-name>
      <filter-class>org.eclipse.jetty.servlets.CrossOriginFilter</filter-class>
      <init-param>
        <param-name>chainPreflight</param-name>
        <param-value>false</param-value>
      </init-param>
      <init-param>
        <param-name>allowedOrigins</param-name>
        <param-value>*</param-value>
      </init-param>
      <init-param>
        <param-name>allowedMethods</param-name>
        <param-value>GET,POST,PUT,DELETE,HEAD,OPTIONS</param-value>
      </init-param>
      <init-param>
        <param-name>allowedHeaders</param-name>
        <param-value>*</param-value>
      </init-param>
    </filter>
    -->
```

and this
```sh
   <!-- Uncomment following filter to enable CORS
    <filter-mapping>
        <filter-name>cross-origin</filter-name>
        <url-pattern>/*</url-pattern>
    </filter-mapping>
    -->
```