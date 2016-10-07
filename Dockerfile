  image: nginx
  volumes:
   - ./site.tpl:/etc/nginx/conf.d/site.tpl
  ports:
   - "80:80"
   - "443:443"
  environment:
   - NGINX_PORT=80
  command: /bin/bash -c "envsubst < /etc/nginx/conf.d/site.tpl > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"
