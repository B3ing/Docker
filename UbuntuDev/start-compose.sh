# /bin/bash
[ $1 == "" ] && exit 1
docker run --privileged -d -v /sys/fs/cgroup:/sys/fs/cgroup -v /home/loick/Bureau/Docker/Cours/Projet/UbuntuDev/data/$1:/home/$1 -P --name ubuntunssh ubuntu:1.0
