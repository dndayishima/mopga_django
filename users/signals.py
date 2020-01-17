from django.db.models.signals import post_save
from django.contrib.auth.models import User
from django.dispatch import receiver
from .models import Profile

# User envoi un signal de type post_save juste avant 
# la création de l'utilisateur dans la Base de données
# Un "receiver" c'est une fonction qui reçoit ce signal et 
# effectue un traitement

@receiver(post_save, sender=User)
def create_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)

@receiver(post_save, sender=User)
def save_profile(sender, instance, **kwargs):
    instance.profile.save()