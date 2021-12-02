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
````
 [ссылка]https://hub.docker.com/r/arseniidoc/netology-home5
 
````
### Задача 2
Посмотрите на сценарий ниже и ответьте на вопрос: "Подходит ли в этом сценарии использование Docker контейнеров или лучше подойдет виртуальная машина, физическая машина? Может быть возможны разные варианты?"
Детально опишите и обоснуйте свой выбор.
```
Сценарий:
    Высоконагруженное монолитное java веб-приложение;
        -Виртуальная или физическая машина. Так необходима устойчивость приложения на большое количество запросов.
    Nodejs веб-приложение;
        -Docker контейнер. В качестве разработки возможно использовать такой вариант.
    Мобильное приложение c версиями для Android и iOS;
        -Docker контейнер или виртуальная машина.
    Шина данных на базе Apache Kafka;
        - Как я понял в этом случае нужна стабильность и Docker не подходит.
  Elasticsearch кластер для реализации логирования продуктивного веб-приложения - три ноды elasticsearch, два logstash и две ноды kibana;
        - Лучше всего подойдет виртуальная машина.
    Мониторинг-стек на базе Prometheus и Grafana;
        -Здесь можно применить контейнер. Можно быстро развернуть и не страшны падения.
    MongoDB, как основное хранилище данных для java-приложения;
        -Виртуальная машина. БД лучше разворачивать на виртуалке или на физ машине.
    Gitlab сервер для реализации CI/CD процессов и приватный (закрытый) Docker Registry.
        Docker контейнер.
````
### Задача 3
   ```
   Запустите первый контейнер из образа centos c любым тэгом в фоновом режиме, подключив папку /data из текущей рабочей директории на хостовой машине в /data контейнера;
    Запустите второй контейнер из образа debian в фоновом режиме, подключив папку /data из текущей рабочей директории на хостовой машине в /data контейнера;
    Подключитесь к первому контейнеру с помощью docker exec и создайте текстовый файл любого содержания в /data;
    Добавьте еще один файл в папку /data на хостовой машине;
    Подключитесь во второй контейнер и отобразите  её листинг и содержание файлов в /data контейнера.
````
```

vagrant@netology1:~$ sudo docker run -v /home/vagrant/date:/date --name centos_obj1 -d  centos7 tail -f /dev/null
982b284cf010c483deaf3362873f0baaa887110d0f0ca25d250b8d0241ae64d2
vagrant@netology1:~$ sudo docker run -v /home/vagrant/date:/date --name debian_obj1 -d  debian:1.01 tail -f /dev/null
d4ab6fc7c3fe91341e02ed099e301930027e5d8569b8be61e7ba28b5961d9e61
vagrant@netology1:~$
vagrant@netology1:~$ sudo docker exec -it centos_obj1 bash
[root@982b284cf010 /]# ls
anaconda-post.log  bin  date  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
[root@982b284cf010 /]# vi /date/filecent
[root@982b284cf010 /]# exit
vagrant@netology1:~$ sudo vi /date/file_host

vagrant@netology1:~/date$ sudo docker exec -it debian_obj1 bash
root@d4ab6fc7c3fe:/# ls
bin  boot  date  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
root@d4ab6fc7c3fe:/# cd /date
root@d4ab6fc7c3fe:/date# ls
file_host  filecent  
root@d4ab6fc7c3fe:/date# exit
````
