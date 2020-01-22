#!/bin/bash
cd /app/mopga_django
python manage.py makemigrations main users
python manage.py migrate