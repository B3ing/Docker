version: "3.3"

services:

  wordpress:
    container_name: wordpress
    deploy:
      placement:
        constraints:
          - node.labels.site == Lyon01
        preferences:
          - spread: node.labels.site
      replicas: 4
      restart_policy:
        condition: on-failure
      resources:
        reservations:
          cpus: '0.05'
          memory: 15M
        limits:
          cpus: "0.1"
          memory: 20M
    image: wordpress
    restart: always
    ports:
      - "8080:80"

  DB:
    container_name: mariadb
    deploy:
      replicas: 2
    image: mariadb
    restart: always
    ports:
      - "3306:3306"
    environment:
      - MYSQL_ROOT_PASSWORD=root
      - MYSQL_USER=wpuser
      - MYSQL_PASSWORD=root
      - MYSQL_DATABASE=wordpress