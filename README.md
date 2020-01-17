# mopga_django
Make Our Planet Green Again - Django - Université d'Angers - Master 2 ACDI

## Pré-requis
Il faut avoir sur son poste :
- python 3
- virtualenv

Si les deux paquets ne sont pas installés, vous pouvez les installer en suivant les instructions ci-dessous :
```bash
sudo apt-get install python-virtualenv python-pip python-dev
```

## Lancement en mode développement
```bash
# Se mettre à la racine du projet (là où se trouve le fichier manage.py)
cd mopga_django

# Création d'un virtualenv
virtualenv venv -p python3

# Activation du virtualenv
source venv/bin/activate

# Une fois que l'environnement virtuel est activé, il faut installé Django.
# Dans ce projet nous sommes sur Django 2.2.*
pip install Django

# lancement du serveur se développement
python manage.py runserver
```
