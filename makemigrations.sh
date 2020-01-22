#!/bin/bash
cd /app/mopga_django

# changement de branche
git checkout develop-dndayishima

# exécution des migrations
python manage.py makemigrations main users
python manage.py migrate