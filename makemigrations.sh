#!/bin/bash

# exécution des migrations
python manage.py makemigrations main users
python manage.py migrate