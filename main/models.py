from django.db import models
from django.contrib.auth.models import User
from django.core.validators import MaxValueValidator, MinValueValidator
from django.urls import reverse
from PIL import Image


class Projet(models.Model):
    intitule = models.CharField(max_length=200)
    description = models.TextField()
    # le monatant souhaité pour le projet
    montant_souhaite = models.DecimalField(default=0.00, max_digits=10, decimal_places=2, blank=True)
    image = models.ImageField(default="projet-default.jpg", upload_to="projects_pics//%d-%m-%Y-%H-%M-%S")
    auteur = models.ForeignKey(User, on_delete=models.CASCADE)
    # est_financé = true si le projet atteint le montant souhaité
    est_finance = models.BooleanField(default=False)
    date_finance = models.DateTimeField(default=None, blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.intitule

    def get_absolute_url(self):
        return reverse('projet-detail', kwargs={'pk': self.pk})

    def save(self, *args, **kwargs):
        """
        redéfinition de la méthode pour effectuer des opérations
        juste avant l'enregistrement du Projet
        """
        super().save(*args, **kwargs)

        """
        ici nous allons redimensionner notre Image
        pour pouvoir stocker des fichiers de petite taille
        """
        img = Image.open(self.image.path)

        output_size = (200, 200)
        img.thumbnail(output_size)
        img.save(self.image.path)


"""
Commentaire: permet à un user de rédiger un commentaire pour un projet
"""


class Commentaire(models.Model):
    contenu = models.TextField(max_length=1500)
    auteur = models.ForeignKey(User, on_delete=models.CASCADE)
    projet = models.ForeignKey(Projet, on_delete=models.CASCADE)
    reactions = models.IntegerField(default=0)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.contenu

"""
Financer: permet à un user de financer un projet
"""


class Financer(models.Model):
    financeur = models.ForeignKey(User, on_delete=models.CASCADE)
    projet = models.ForeignKey(Projet, on_delete=models.CASCADE)
    montant = models.DecimalField(default=0.00, max_digits=10, decimal_places=2, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.financeur.username


"""
Evaluer: permet de donner une evaluation à un projet par un user
Si le user est 'expert’ il pourra évaluer le projet avec une note
"""

class Evaluer(models.Model):
    evaluateur = models.ForeignKey(User, on_delete=models.CASCADE)
    projet = models.ForeignKey(Projet, on_delete=models.CASCADE)
    note_projet = models.PositiveIntegerField(default=0, validators=[MaxValueValidator(10)])
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.evaluateur.username


"""
Like permet de sauvegarder les réactions des utilisateurs pour les commentaires
"""
class Like(models.Model):
    like_authenticate_user = models.ForeignKey(User, on_delete=models.CASCADE)
    evaluation = models.ForeignKey(Commentaire, on_delete=models.CASCADE)
    type = models.PositiveIntegerField(default=0)
    date_like = models.DateTimeField(auto_now_add=True, blank=True)
