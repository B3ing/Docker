# /bin/bash
[ "$1" == "" ] && exit 1
docker run --rm --privileged -d -v /sys/fs/cgroup:/sys/fs/cgroup -v /data/home/$1:/data/home/$1 -P --name $1 aveylon/projet_b3_docker:ubuntu-b1
