#!/bin/bash

python manage.py makemigrations main users
python manage.py migrate