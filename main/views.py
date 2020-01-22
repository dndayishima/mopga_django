from django.http import HttpResponse
from main.functions import *
from django.core.mail import send_mail, BadHeaderError
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.contrib.auth.models import User
from django.views.generic import ListView, DetailView, CreateView, UpdateView, DeleteView
from django.contrib import messages
from .forms import CommentForm, FinancerForm, EvaluerForm, ContactForm
from .models import Projet, Commentaire, Like, Financer
from django.contrib.auth.decorators import login_required
import re
from django.db.models import Q

"""
home: afficher les projets
"""
def home(request):
    context = {
        'title': 'Home Page',
        'content_title': 'Projets publiés',
        'projets': Projet.objects.all()
    }
    return render(request, 'main/home.html', context)


"""
about: la page Qui sommes-nous
"""
def about(request):
    context = {
        'title': 'About'
    }
    return render(request, 'main/about.html', context)


"""
La page contact --> Envoyer un mail
"""
def contact(request):

    context = {
        'title': 'Contactez-nous'
    }

    if request.method == 'GET':
        form = ContactForm()
    else:
        form = ContactForm(request.POST)
        if form.is_valid():
            subject = form.cleaned_data['subject']
            from_email = form.cleaned_data['from_email']
            message = form.cleaned_data['message']
            try:
                send_mail(subject, message, from_email, ['msalimyoussef@gmail.com'])
            except BadHeaderError:
                return HttpResponse('Invalid header found.')
            messages.success(request, "Votre mail est bien envoyé, Merci.")
            return redirect('main-contact')
    return render(request, "main/contact.html", {'form': form})


"""
Aficher le dernier projet financé
"""
def projetFinance(request):

    projet = Projet.objects.filter(est_finance=True).order_by('-date_finance').last()

    context = {
        'commentaires': Commentaire.objects.all().filter(projet=projet),
        'projet': projet,
        'note_moyenne': note_moyenne(projet.pk)
    }

    return render(request, 'main/home.html', context)


def privacy(request):
    context = {
        'title': 'Mentions légales'
    }
    return render(request, 'main/privacy_policy.html', context)


"""
Afficher les projets par date de création et avec une paggination en 3
"""
class ProjetListView(ListView):
    model = Projet
    template_name = 'main/projet/projets.html'
    context_object_name = 'projets'
    ordering = ['-created_at']
    paginate_by = 3


"""
Afficher les projets d'un utilisateur par date de création et avec une paggination en 3
"""
class UserProjetListView(ListView):
    model = Projet
    template_name = 'main/projet/user_projets.html'
    context_object_name = 'projets'
    paginate_by = 3

    def get_queryset(self):
        user = get_object_or_404(User, username=self.kwargs.get('username'))
        return Projet.objects.filter(auteur=user).order_by('-created_at')


"""
Afficher les details d'un projet et aussi ces commentaires
"""
class ProjetDetailView(DetailView):
    model = Projet
    template_name = 'main/projet/projet_detail.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        commentaires = Commentaire.objects.all().filter(projet=self.kwargs['pk'])
        projet = get_object_or_404(Projet, pk=self.kwargs['pk'])

        context['commentaires'] = commentaires
        context['note_moyenne'] = note_moyenne(self.kwargs['pk'])

        projet = get_object_or_404(Projet, pk=self.kwargs['pk'])

        if self.request.method == "POST":
            form = CommentForm(self.request.POST)
            if form.is_valid():
                comment = form.save(commit=False)
                comment.projet = projet
                comment.auteur = self.request.user
                comment.save()
                return redirect('projet-detail', pk=projet.pk)
        else:
            form = CommentForm()

        context['form'] = form

        return context


"""
Créer un nouveau projet
"""
class ProjetCreateView(LoginRequiredMixin, CreateView):
    model = Projet
    template_name = 'main/projet/projet_form.html'

    fields = ['intitule', 'description', 'montant_souhaite', 'image']

    def form_valid(self, form):
        form.instance.auteur = self.request.user
        return super().form_valid(form)


"""
Modifier un projet
"""
class ProjetUpdateView(LoginRequiredMixin, UserPassesTestMixin, UpdateView):
    model = Projet
    template_name = 'main/projet/projet_form.html'

    fields = ['intitule', 'description', 'montant_souhaite', 'image']

    def form_valid(self, form):
        form.instance.auteur = self.request.user
        return super().form_valid(form)

    def test_func(self):
        projet = self.get_object()
        if self.request.user == projet.auteur:
            return True
        return False

"""
Supprimer un projet
"""
class ProjetDeleteView(LoginRequiredMixin, UserPassesTestMixin, DeleteView):
    model = Projet
    template_name = 'main/projet/projet_confirm_delete.html'

    success_url = '/'

    def test_func(self):
        projet = self.get_object()
        if self.request.user == projet.auteur:
            return True
        return False

"""
Ajouter un commentaire à un projet
"""
@login_required
def add_comment_to_projet(request, pk):
    projet = get_object_or_404(Projet, pk=pk)
    if request.method == "POST":
        form = CommentForm(request.POST)
        if form.is_valid():
            comment = form.save(commit=False)
            comment.projet = projet
            comment.auteur = request.user
            comment.save()
            return redirect('projet-detail', pk=projet.pk)
    else:
        form = CommentForm()
    return render(request, 'main/projet/add_comment_to_projet.html', {'form': form})

"""
Réactions des utilisateurs avec les commentaires
"""
def like_comment(request, pk, pkcom):
    commentaire = Commentaire.objects.all().filter(pk=pkcom).first()
    user = User.objects.all().filter(pk=request.user.pk).first()
    reaction_commentaire_fromdb = Like.objects.all().filter(like_authenticate_user=user, evaluation=commentaire).first()
    if reaction_commentaire_fromdb is None:
        reaction_commentaire = Like()
        reaction_commentaire.evaluation = commentaire
        reaction_commentaire.like_authenticate_user = user
        reaction_commentaire.type = 1
        Commentaire.objects.all().filter(pk=pkcom).update(reactions=commentaire.reactions + 1)
        reaction_commentaire.save()

    else:
        reaction_commentaire_fromdb.delete()
    return redirect('projet-detail', pk=pk)


"""
Financer un projet: permet d'ajouter un montant afin de participer au financement d'un projet
"""
@login_required
def financer_projet(request, pk):
    projet = get_object_or_404(Projet, pk=pk)
    if request.method == "POST":
        form = FinancerForm(request.POST)
        if form.is_valid():
            finance = form.save(commit=False)
            finance.projet = projet
            finance.financeur = request.user
            finance.save()

            # verifier si le projet est financé
            # Probleme combaraison entre decimal et QuerySet
            #est_finance(pk)

            return redirect('projet-detail', pk=projet.pk)
    else:
        form = FinancerForm()
    return render(request, 'main/projet/financer_projet.html', {'form': form})


"""
Permet l'evaluation d'un projet via l'ajout d'une note
"""
@login_required
def evaluer_projet(request, pk):
    projet = get_object_or_404(Projet, pk=pk)
    if request.method == "POST":
        form = EvaluerForm(request.POST)
        if form.is_valid():
            evaluation = form.save(commit=False)
            evaluation.projet = projet
            evaluation.evaluateur = request.user
            evaluation.save()
            return redirect('projet-detail', pk=projet.pk)
    else:
        form = EvaluerForm()
    return render(request, 'main/projet/evaluer_projet.html', {'form': form})


"""
Page Recherche
"""
def recherche(request):
    projets = None
    if ('q' in request.GET) and request.GET['q'].strip():
        query_string = request.GET['q']

        entry_query = get_query(query_string, ['intitule', 'description'])

        projets = Projet.objects.filter(entry_query)

    return render(request, 'main/recherche.html', {'projets': projets})



def normalize_query(query_string,
                    findterms=re.compile(r'"([^"]+)"|(\S+)').findall,
                    normspace=re.compile(r'\s{2,}').sub):
    ''' Splits the query string in invidual keywords, getting rid of unecessary spaces
        and grouping quoted words together.
        Example:

        >>> normalize_query('  some random  words "with   quotes  " and   spaces')
        ['some', 'random', 'words', 'with quotes', 'and', 'spaces']

    '''
    return [normspace(' ', (t[0] or t[1]).strip()) for t in findterms(query_string)]

def get_query(query_string, search_fields):
    ''' Returns a query, that is a combination of Q objects. That combination
        aims to search keywords within a model by testing the given search fields.

    '''
    query = None # Query to search for every search term
    terms = normalize_query(query_string)
    for term in terms:
        or_query = None # Query to search for a given term in each field
        for field_name in search_fields:
            q = Q(**{"%s__icontains" % field_name: term})
            if or_query is None:
                or_query = q
            else:
                or_query = or_query | q
        if query is None:
            query = or_query
        else:
            query = query & or_query
    return query
