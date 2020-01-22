from main.models import Financer, Projet, Evaluer
from django.db.models import Sum, Avg
from users.models import Profile

"""
Vérifier si un projet est financé
"""
def est_finance(projet_id):

    total = Financer.objects.annotate(total=Sum('montant')).filter(pk=projet_id)
    projet = Projet.objects.all().filter(pk=projet_id).first()

    montant_requis = projet.montant_souhaite

    return (total >= montant_requis)


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

    moyenne = Evaluer.objects.aggregate(average_rating=Avg('note_projet')).filter(pk=projet_id)

    return moyenne


"""
Calculer les 'Points gagnés' pour un utilisateur
"""
def points_gagnes():

    return 0

