## Домашнее задание к занятию "5.3. Введение. Экосистема. Архитектура. Жизненный цикл Docker контейнера"

### Задача 1

Сценарий выполения задачи:

- создайте свой репозиторий на https://hub.docker.com;
- выберете любой образ, который содержит веб-сервер Nginx;
- создайте свой fork образа;
- реализуйте функциональность:
запуск веб-сервера в фоне с индекс-страницей, содержащей HTML-код ниже:
```
<html>
<head>
Hey, Netology
</head>
<body>
<h1>I’m DevOps Engineer!</h1>
</body>
</html>
```
Опубликуйте созданный форк в своем репозитории и предоставьте ответ в виде ссылки на https://hub.docker.com/username_repo.

Файл nginx.conf
user www-data;
worker_processes auto;
pid /run/nginx.pid;
events {
        worker_connections 1024;
        multi_accept on;
}
http {
     sendfile on;
     tcp_nopush on;
     tcp_nodelay on;
     keepalive_timeout 15;
     types_hash_max_size 2048;
     server_tokens off;
     #include /etc/nginx/mime.types;
     #default_type text/javascript;
     access_log off;
     #error_log /var/log/nginx/error.log;
     gzip on;
     gzip_min_length 100;
     gzip_http_version 1.1;
     gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;
     client_max_body_size 8M;
server {
       listen 80;
       server_name localhost;
       root /usr/share/nginx/html;
       location /{
          index index.html;
       }
     }
}


