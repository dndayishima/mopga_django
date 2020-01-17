from django.db import models
from django.contrib.auth.models import User

# Un utilisateur a un profile -> un profile est associé à un utilisateur
# Relation de 1 -> 1 avec User
# Si un utilisateur est supprimé, son profile l'est aussi
class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    image = models.ImageField(default="default.png", upload_to="profile_pics")

    def __str__(self):
        return self.user.username