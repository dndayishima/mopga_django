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
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.intitule

    def get_absolute_url(self):
        return reverse('projet-detail', kwargs={'pk': self.pk})
