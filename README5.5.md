## Домашнее задание к занятию "5.5. Оркестрация кластером Docker контейнеров на примере Docker Swarm"
### Задача 1
### Дайте письменые ответы на следующие вопросы:
````
    В чём отличие режимов работы сервисов в Docker Swarm кластере: replication и global?
    Какой алгоритм выбора лидера используется в Docker Swarm кластере?
    Что такое Overlay Network?
````
````
 Для replication службы указывается количество идентичных задач которые необходимо выполнить на определеных узле или на одном узле.
   Global  это служба которая выполняет одну задачу (реплику) на каждом узле.
 При инициализации swarm mode командой:
  docker swarm init   первая нода кластера становится лидером.
 Overlay Network позволяет связывать контейнеры Docker Swarm расположенные на разных физических хостах, если все они в одной сети.  
````
### Задача 2
### Создать ваш первый Docker Swarm кластер в Яндекс.Облаке
````
Для получения зачета, вам необходимо предоставить скриншот из терминала (консоли), с выводом команды:
docker node ls

vagrant@netology1:~/ya-cloud/terraform$ ssh centos@62.84.126.239
[centos@node01 ~]$ sudo -i
[root@node01 ~]# docker node ls
ID                            HOSTNAME             STATUS    AVAILABILITY   MANAGER STATUS   ENGINE VERSION
o6bojbpqcyj9kx2qmvmjw14qm *   node01.netology.yc   Ready     Active         Reachable        20.10.12
r97prptkfkzjlkri99csw314u     node02.netology.yc   Ready     Active         Reachable        20.10.12
z8ls8xvxyyt5ej9apv83exo3x     node03.netology.yc   Ready     Active         Leader           20.10.12
j9y3t8xhpq93zxi83jje1ex6r     node04.netology.yc   Ready     Active                          20.10.12
j2rrfg2xs5ppijwpn2jnus97o     node05.netology.yc   Ready     Active                          20.10.12
3aixehocakmwdhiuoki196kel     node06.netology.yc   Ready     Active                          20.10.12
[root@node01 ~]#
````
### Задача 3
### Создать ваш первый, готовый к боевой эксплуатации кластер мониторинга, состоящий из стека микросервисов.
````
Для получения зачета, вам необходимо предоставить скриншот из терминала (консоли), с выводом команды:
docker service ls
````
````
[root@node01 ~]# docker service ls
ID             NAME                                MODE         REPLICAS   IMAGE                                          PORTS
7rstgquvk72k   swarm_monitoring_alertmanager       replicated   1/1        stefanprodan/swarmprom-alertmanager:v0.14.0
sikklolnab7l   swarm_monitoring_caddy              replicated   1/1        stefanprodan/caddy:latest                      *:3000->3000/tcp, *:9090->9090/tcp, *:9093-9094->9093-9094/tcp
ffe4rhltkyxl   swarm_monitoring_cadvisor           global       6/6        google/cadvisor:latest
d69dvo53z574   swarm_monitoring_dockerd-exporter   global       6/6        stefanprodan/caddy:latest
ads5o4xom0b0   swarm_monitoring_grafana            replicated   1/1        stefanprodan/swarmprom-grafana:5.3.4
l9z124m9zei6   swarm_monitoring_node-exporter      global       6/6        stefanprodan/swarmprom-node-exporter:v0.16.0
wn8f7xkgqe78   swarm_monitoring_prometheus         replicated   1/1        stefanprodan/swarmprom-prometheus:v2.5.0
sqiqrsswnq9z   swarm_monitoring_unsee              replicated   1/1        cloudflare/unsee:v0.8.0
[root@node01 ~]#
[root@node01 ~]# docker node ls
ID                            HOSTNAME             STATUS    AVAILABILITY   MANAGER STATUS   ENGINE VERSION
o6bojbpqcyj9kx2qmvmjw14qm *   node01.netology.yc   Ready     Active         Leader           20.10.12
r97prptkfkzjlkri99csw314u     node02.netology.yc   Ready     Active         Reachable        20.10.12
z8ls8xvxyyt5ej9apv83exo3x     node03.netology.yc   Down      Active         Unreachable      20.10.12
j9y3t8xhpq93zxi83jje1ex6r     node04.netology.yc   Ready     Active                          20.10.12
j2rrfg2xs5ppijwpn2jnus97o     node05.netology.yc   Ready     Active                          20.10.12
3aixehocakmwdhiuoki196kel     node06.netology.yc   Ready     Active                          20.10.12destroy 
````
### Задача 4 (*)
### Выполнить на лидере Docker Swarm кластера команду (указанную ниже) и дать письменное описание её функционала, что она делает и зачем она нужна:
````
#### см.документацию: https://docs.docker.com/engine/swarm/swarm_manager_locking/
docker swarm update --autolock=true
````
````
vagrant@netology1:~/ya-cloud/terraform$ ssh centos@51.250.4.72
[centos@node03 ~]$ sudo -i
[root@node03 ~]# docker node ls
ID                            HOSTNAME             STATUS    AVAILABILITY   MANAGER STATUS   ENGINE VERSION
o6bojbpqcyj9kx2qmvmjw14qm     node01.netology.yc   Ready     Active         Reachable        20.10.12
r97prptkfkzjlkri99csw314u     node02.netology.yc   Ready     Active         Reachable        20.10.12
z8ls8xvxyyt5ej9apv83exo3x *   node03.netology.yc   Ready     Active         Leader           20.10.12
j9y3t8xhpq93zxi83jje1ex6r     node04.netology.yc   Ready     Active                          20.10.12
j2rrfg2xs5ppijwpn2jnus97o     node05.netology.yc   Ready     Active                          20.10.12
3aixehocakmwdhiuoki196kel     node06.netology.yc   Ready     Active                          20.10.12
[root@node03 ~]# docker swarm update --autolock=true
Swarm updated.
To unlock a swarm manager after it restarts, run the `docker swarm unlock`
command and provide the following key:

    SWMKEY-1-hONvvHWjuip8ZrZNVZw45m9gWQC+JxN3uMfy70iWAF0

Please remember to store this key in a password manager, since without it you
will not be able to restart the manager.
По умолчанию Docker шифрует журналы Raft.  После запуска данной команды, Docker дает право самостоятельно устанавливать ключ шифрования журналов.
Эта команда блокирует менеджеры роя и требует ручной разблокировки . После перезапуска Docker необходимо разблокировать менеджеры роя,
используя ключ сгенерированный данной командой.
````
