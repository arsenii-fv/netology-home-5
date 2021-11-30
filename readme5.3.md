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
### Задача 2
Посмотрите на сценарий ниже и ответьте на вопрос: "Подходит ли в этом сценарии использование Docker контейнеров или лучше подойдет виртуальная машина, физическая машина? Может быть возможны разные варианты?"
Детально опишите и обоснуйте свой выбор.
--
Сценарий:
    Высоконагруженное монолитное java веб-приложение;
        -Виртуальная или физическая машина.
    Nodejs веб-приложение;
        -Docker контейнер.
    Мобильное приложение c версиями для Android и iOS;
        -Docker контейнер или виртуальная машина.
    Шина данных на базе Apache Kafka;
    
    Elasticsearch кластер для реализации логирования продуктивного веб-приложения - три ноды elasticsearch, два logstash и две ноды kibana;
    Мониторинг-стек на базе Prometheus и Grafana;
    MongoDB, как основное хранилище данных для java-приложения;
        -Виртуальная машина.
    Gitlab сервер для реализации CI/CD процессов и приватный (закрытый) Docker Registry.
        Docker контейнер.

### Задача 3
   ```
   Запустите первый контейнер из образа centos c любым тэгом в фоновом режиме, подключив папку /data из текущей рабочей директории на хостовой машине в /data контейнера;
    Запустите второй контейнер из образа debian в фоновом режиме, подключив папку /data из текущей рабочей директории на хостовой машине в /data контейнера;
    Подключитесь к первому контейнеру с помощью docker exec и создайте текстовый файл любого содержания в /data;
    Добавьте еще один файл в папку /data на хостовой машине;
    Подключитесь во второй контейнер и отобразите  ё листинг и содержание файлов в /data контейнера.
````
vagrant@netology1:~/debian$ sudo docker exec -d centos_obj1 touch /date/file_cent
vagrant@netology1:~/debian$ sudo docker exec -it centos_obj1 bash
[root@99f9c4e4e665 /]# ls
anaconda-post.log  bin  date  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
[root@99f9c4e4e665 /]# cd /date
[root@99f9c4e4e665 date]# ls
file_cent  testfile.txt
[root@99f9c4e4e665 date]# vi file_cent
[root@99f9c4e4e665 date]# exit
exit

vagrant@netology1:~$ ls
centos  date  debian  nginx-i
vagrant@netology1:~$ cd date
vagrant@netology1:~/date$ sudo vi file_host

vagrant@netology1:~/date$ sudo docker exec -it debian_obj1 bash
root@dafec29cc961:/# ls
bin  boot  date  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
root@dafec29cc961:/# cd date
root@dafec29cc961:/date# ls
file_cent  file_host  testfile.txt
root@dafec29cc961:/date#

