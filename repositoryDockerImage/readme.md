


Un registry Docker est une application server de type conteneur qui permet de stocker et distribuer des images Docker.

Ce dernier permet :
- un controle sur où sont stockées les images
- une gestion du réseau de distribution de nos images
- une intégration de la distribution d'image dans notre workflow local

# Installation avec Docker Compose


```yaml
version: "3.3"

services:

  repoDocker:
    container_name: repositoryDocker
    image: registry
    restart: unless-stopped
    ports:
      - "5000:5000"
```

Démarrer la configuration à l'aide de : 

```bash
$ docker-compose up -d
```

# Utilisation du repository

Récupérer une image depuis le repository local :

```bash
$ docker pull mondomaine:5000/monimage
```

Personnaliser une image pour l'envoyer sur le repository local :

```bash
$ docker tag monimage mondomaine:5000/monimage
$ docker push mondomaine:5000/monimage
```

