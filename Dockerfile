############################################################
# Dockerfile to build container for Tests
# Based on Debian
# include NGINX
############################################################

# Set the base image to Ubuntu
FROM nginx:1.11.3

# File Author / Maintainer
MAINTAINER Alexey Gordeyev <aleksej@gordejev.lv>

ENV WEB_DOCUMENT_ROOT  /app/
ENV WEB_DOCUMENT_INDEX index.html
ENV WEB_ALIAS_DOMAIN   *.vm

# Install wget and install/updates certificates
RUN apt-get update \
 && apt-get install -y -q --no-install-recommends \
    ca-certificates wget curl \
 && apt-get clean \
 && rm -r /var/lib/apt/lists/* \
 && ls /etc/nginx

# Expose the default port
EXPOSE 80 443

VOLUME ["/app/","/etc/nginx/"]

WORKDIR /app/

