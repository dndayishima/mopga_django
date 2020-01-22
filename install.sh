#!/bin/bash

# Création des conteneurs (Django et MySQL)
sudo docker-compose up -d --build

# exécution des migrations après la création des conteneurs
#docker-compose run web /bin/bash makemigrations.sh