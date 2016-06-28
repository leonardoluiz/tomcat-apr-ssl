Apache Tomcat with APR native libraries and SSL support
========================================================

Apache Tomcat built with APR native libraries and SSL support


### How to build
```
docker build -t leonardoluiz/tomcat-apr .
```

### How to run
```
docker run -d -p 80:80 -p 443:443 --name tomcatssl leonardoluiz/tomcat-apr
```

### SSL support

You must create a private key and a certificate for your server then copy thos files to tomcat conf folder.
Take a look at server.xml ;-)



