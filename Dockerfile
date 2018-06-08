############################################################
# Dockerfile to build container for Tests
# Based on Alpine
# include NGINX
############################################################

# Set the base image to Alpine
FROM nginx:alpine-perl

# File Author / Maintainer
MAINTAINER Alexey Gordeyev <aleksej@gordejev.lv>

ENV WEB_DOCUMENT_ROOT  /var/www/html/
ENV WEB_DOCUMENT_INDEX index.html
ENV WEB_ALIAS_DOMAIN   *.vm

# Install wget and install/updates certificates
RUN apk update && apk upgrade && \
    apk add --no-cache bash && \
    rm -rf /var/cache/apk/*

# RUN rm -rf /etc/nginx
RUN rm /etc/nginx/*.conf && \
    rm /etc/nginx/*_params && \
    rm /etc/nginx/*.default && \
    rm /etc/nginx/conf.d/*

COPY ./conf /etc/nginx
COPY ./html /var/www/html

# Expose the default port
EXPOSE 80 443

VOLUME ["/var/www/html/", "/etc/nginx/vhosts/","/etc/nginx/conf.d/", "/etc/nginx/snippets/", "/etc/nginx/upstreams/", "/var/log/nginx/"]

WORKDIR /var/www/html/

