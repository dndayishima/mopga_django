# Construction d'un image Django, en nous basant sur l'image officielle
# python version 3
FROM python:3

ENV PYTHONUNBUFFERED 1

# Utilisation de l'interpreteur BASH
# pour toutes les commandes RUN
SHELL ["/bin/bash", "-c"]

# Le répertoire dans lequel sera notre application
RUN mkdir /app

# Définir ce répertoire comme étant le WORKDIR - Répertoire d'entrée
WORKDIR /app

# Copie du fichier requirements.txt
COPY ./requirements.txt /app/

# Installation de tous les modules décrits dans le requirements.txt
RUN pip install -r requirements.txt

# Récupération du code source depuis un repo GIT
#COPY . /app/
RUN git clone https://github.com/dndayishima/mopga_django.git