# install openresty
FROM openresty/openresty:alpine-fat

# install openssl 
RUN apk --no-cache add bash openssl;

# install lua-resty-auto-ssl
RUN /usr/local/openresty/luajit/bin/luarocks install lua-resty-auto-ssl

# generate openssl base key
RUN openssl req -new -newkey rsa:2048 -days 3650 -nodes -x509 -subj '/CN=sni-support-required-for-valid-ssl' -keyout /etc/ssl/resty-auto-ssl-fallback.key -out /etc/ssl/resty-auto-ssl-fallback.crt

# upload nginx configuration file
ADD nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
ADD workers.conf /usr/local/openresty/nginx/conf/workers.conf

# lua-resty-auto-ssl Permission
VOLUME /etc/resty-auto-ssl

# start service
ENTRYPOINT ["/usr/local/openresty/nginx/sbin/nginx", "-g", "daemon off;"]
