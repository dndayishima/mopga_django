from django.db.models.functions import Now

from main.models import Financer, Projet, Evaluer
from django.db.models import Sum, Avg
from users.models import Profile

"""
Vérifier si un projet est financé
"""
def est_finance(projet_id):

    total = Financer.objects.filter(pk=projet_id).annotate(total=Sum('montant'))

    projet = Projet.objects.all().filter(pk=projet_id).first()

    montant_requis = projet.montant_souhaite

    if total >= montant_requis:
        Projet.objects.all().filter(pk=projet_id).update(est_finance=True, date_finance=Now())



"""
Vérifier si un utilisateur est expert
"""
def est_expert(user_id):

    profile = Profile.objects.all().filter(pk=user_id).first()
    return profile.is_expert


"""
Calculer la note moyenne d'un projet
"""
def note_moyenne(projet_id):

    moyenne = Evaluer.objects.filter(pk=projet_id).aggregate(moyenne=Avg('note_projet'))

    return moyenne


"""
Calculer les 'Points gagnés' pour un utilisateur
"""
def points_gagnes():

    return 0

