# docker-openresty-loadbalancer
Docker образ включающий, Openresty, автоматическую генерацию SSL сертификата, балансировка нагрузки на Backend сервера. Предназначен для конструкторов веб-приложений. 
# Установка
```
apt update 
apt install docker git -y 
git clone git@github.com:ekirishima/docker-openresty-loadbalancer.git
docker build .
> Successfully built dd86d2d9477b (container name)
docker run -p 80:80 -p 443:443 -v /home/ssl:/etc/resty-auto-ssl dd86d2d9477b
```
Вместо /home/ssl - путь до директории хранения SSL сертификатов.
В файле workers.conf указываем ip, домен backend приложения
