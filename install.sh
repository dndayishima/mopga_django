#!/bin/bash

# Création des conteneurs (Django et MySQL)
sudo docker-compose up -d --build

echo "Attente du lancement du conteneur de la base de données"
sleep 10

# Restart du conteneur django
sudo docker-compose restart web