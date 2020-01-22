#!/bin/bash

# Construction des images Docker
sudo docker-compose build

# Création des conteneurs (Django et MySQL)
sudo docker-compose up -d

# exécution des migrations après la création des conteneurs
docker-compose run web /bin/bash /app/mopga_django/makemigrations.sh