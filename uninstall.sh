#!/bin/bash

echo "DESINSTALLATION ET SUPPRESSION DE LA BASE DE DONNEES"

docker-compose down
sudo rm -rf db