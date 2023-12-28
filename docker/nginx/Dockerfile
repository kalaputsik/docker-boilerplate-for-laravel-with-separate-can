FROM nginx:alpine

ARG USER
ARG GROUP

RUN mkdir -p /var/www/html/public

COPY default.conf.template /etc/nginx/conf.d/

CMD /bin/sh -c "envsubst '\$APP_PHP_SERVICE_NAME,\$NGINX_PORT,\$APP_PHP_PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;'

RUN sed -i "s/user www-data/user ${USER}/g" /etc/nginx/nginx.conf

RUN adduser -g ${GROUP} -s /bin/sh -D ${USER}