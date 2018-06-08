# /bin/bash
[ "$1" == "" ] && exit 1
docker run --rm --privileged -d -v /sys/fs/cgroup:/sys/fs/cgroup -v /Users/Florian/Desktop/Cours/B3/Docker/Docker/UbuntuDev/data/$1:/data/home/$1 -P --name $1 aveylon/projet_b3_docker:ubuntu-b1
