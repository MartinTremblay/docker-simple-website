# docker-simple-website
Simple example to quickstart your local docker env

New to docker? Here a few simple way to setup your local web environnement in docker.

### Tech used
1. nginx
2. apache
3. varnish 

### Notes

The apache dockerfile will also set up the locale and timezone. It will also install xdebug, rewrite mod and other common mod (gd, exif, mcrypt, etc.)

## Multiple apache

using multiple-apachephp

will start two instances of apache for each website on different port

```
#on your host file
ip.of.your.dockermachine		website1on8001.yoursite.you
ip.of.your.dockermachine		website2on8002.yoursite.you
```
with docker-compose
```
docker-compose up --build
```
or in detach mode
```
docker-compose up --build -d
```
or from the root of the repo
```
docker-compose -f reverseproxy-cache-multipleapache/docker-compose.yml up --build
```
then from your browser
```
http://website1on8001.yoursite.you:8001
http://website1on8002.yoursite.you:8002
```

## Reverse proxy + multiple apache

using reverseproxy-apachephp

will start an automatic reverse proxy linking multiple apache container to a proxy. No configuration needed in the proxy

```
#on your host file
ip.of.your.dockermachine		website1.yoursite.you
ip.of.your.dockermachine		website2.yoursite.you
```
with docker-compose
```
docker-compose up --build
```
or in detach mode
```
docker-compose up --build -d
```
or from the root of the repo
```
docker-compose -f reverseproxy-apachephp/docker-compose.yml up --build
```
then from your browser
```
http://website1.yoursite.you
http://website2.yoursite.you
```

## Reverse proxy + cache + multiple apache

using reverseproxy-cache-apachephp

will used nginx as a reverse-proxy, sending request to a cache varnish, sending missed to multiple apache.
Some configuration is needed

```
#on your host file
ip.of.your.dockermachine		cache-website1.yoursite.you
ip.of.your.dockermachine		cache-website2.yoursite.you
```
with docker-compose
```
docker-compose up --build
```
or in detach mode
```
docker-compose up --build -d
```
or from the root of the repo
```
docker-compose -f reverseproxy-cache-multipleapache/docker-compose.yml up --build
```
then from your browser
```
http://cache-website1.yoursite.you
http://cache-website2.yoursite.you
```
