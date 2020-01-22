from django.db import models
from django.contrib.auth.models import User
from PIL import Image


# Un utilisateur a un profile -> un profile est associé à un utilisateur
# Relation de 1 -> 1 avec User
# Si un utilisateur est supprimé, son profile l'est aussi
class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    #image = models.ImageField(default="default.png", upload_to="profile_pics/%d-%m-%Y-%H-%M-%S")
    image = models.ImageField(default="default.png", upload_to="profile_pics/")
    is_expert = models.BooleanField(default=False)
    points_gagnes = models.IntegerField(default=0)

    def __str__(self):
        return self.user.username

    def save(self, *args, **kwargs):
        # redéfinition de la méthode pour effectuer des opérations
        # juste avant l'enregistrement du Profile
        super().save(*args, **kwargs)

        # ici nous allons redimensionner notre Image
        # pour pouvoir stocker des fichiers de petite taille

        img = Image.open(self.image.path)

        output_size = (60, 60)
        img.thumbnail(output_size)
        img.save(self.image.path)


class PersonManager(models.Manager):

    """
    Vérifier si un utilisateur est expert
    """
    def est_expert(self):
        profile = Profile.objects.all().filter(pk=self.pk).first()
        return profile.is_expert
