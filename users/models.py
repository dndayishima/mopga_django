from django.db import models
from django.contrib.auth.models import User
from PIL import Image

# Un utilisateur a un profile -> un profile est associé à un utilisateur
# Relation de 1 -> 1 avec User
# Si un utilisateur est supprimé, son profile l'est aussi
class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    image = models.ImageField(default="profile_pics/default.png", upload_to="profile_pics")
    is_expert = models.BooleanField(default=False)

    def __str__(self):
        return self.user.username

    def save(self):
        # redéfinition de la méthode pour effectuer des opérations
        # juste avant l'enregistrement du Profile
        super().save()

        # ici nous allons redimensionner notre Image
        # pour pouvoir stocker des fichiers de petite taille

        img = Image.open(self.image.path)

        if img.height > 300 or img.width > 300:
            output_size = (300, 300)
            img.thumbnail(output_size)
            img.save(self.image.path)