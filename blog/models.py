from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User
from django.core.validators import MaxValueValidator, MinValueValidator
from django.urls import reverse


class Projet(models.Model):
    intitule = models.CharField(max_length=200)
    description = models.TextField()
    montant_souhaite = models.DecimalField(default=0.00, max_digits=10, decimal_places=2, blank=True)
    auteur = models.ForeignKey(User, on_delete=models.CASCADE)
    est_finance = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.intitule

    def get_absolute_url(self):
        return reverse('projet-detail', kwargs={'pk': self.pk})


# Financer: permet à un user de financer un projet
class Financer(models.Model):
    financeur = models.ForeignKey(User, on_delete=models.CASCADE)
    projet = models.ForeignKey(Projet, on_delete=models.CASCADE)
    montant = models.DecimalField(default=0.00, max_digits=10, decimal_places=2, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.financeur.username


# Evaluer: permet de donner une evaluation à un projet par un user
# Si le user est 'expert’ il pourra évaluer le projet avec une note
class Evaluer(models.Model):
    evaluateur = models.ForeignKey(User, on_delete=models.CASCADE)
    projet = models.ForeignKey(Projet, on_delete=models.CASCADE)
    note_projet = models.PositiveIntegerField(default=0, validators=[MaxValueValidator(10)])
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.evaluateur.username


# Commentaire: permet à un user de regiger un commentaire pour un projet
class Commentaire(models.Model):
    contenu = models.TextField(max_length=1500)
    auteur = models.ForeignKey(User, on_delete=models.CASCADE)
    projet = models.ForeignKey(Projet, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.contenu


# Karma: permet à un user d'interagir avec les commentaires on mettant des 'like'
# Aussi il permet des calcules afin de changer le profile d'un user vers 'expert'
class Karma(models.Model):
    auteur = models.ForeignKey(User, on_delete=models.CASCADE)
    commentaire = models.ForeignKey(Commentaire, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.auteur.username
