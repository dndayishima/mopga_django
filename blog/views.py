from django.shortcuts import render, get_object_or_404
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.contrib.auth.models import User
from django.views.generic import ListView, DetailView, CreateView, UpdateView, DeleteView
from .models import Projet


def home(request):
    context = {
        'posts': Projet.objects.all()
    }
    return render(request, 'blog/home.html', context)


def about(request):
    context = {
        'title': 'About'
    }
    return render(request, 'blog/about.html', context)


class ProjetListView(ListView):
    model = Projet
    template_name = 'blog/home.html'
    context_object_name = 'projets'
    ordering = ['-created_at']
    paginate_by = 3


class UserProjetListView(ListView):
    model = Projet
    template_name = 'blog/user_projets.html'
    context_object_name = 'projets'
    paginate_by = 3

    def get_queryset(self):
        user = get_object_or_404(User, username=self.kwargs.get('username'))
        return Projet.objects.filter(auteur=user).order_by('-created_at')


class ProjetDetailView(DetailView):
    model = Projet


class ProjetCreateView(LoginRequiredMixin, CreateView):
    model = Projet
    fields = ['intitule', 'description', 'montant_souhaite']

    def form_valid(self, form):
        form.instance.auteur = self.request.user
        return super().form_valid(form)


class ProjetUpdateView(LoginRequiredMixin, UserPassesTestMixin, UpdateView):
    model = Projet
    fields = ['intitule', 'description', 'montant_souhaite']

    def form_valid(self, form):
        form.instance.auteur = self.request.user
        return super().form_valid(form)

    def test_func(self):
        projet = self.get_object()
        if self.request.user == projet.auteur:
            return True
        return False


class ProjetDeleteView(LoginRequiredMixin, UserPassesTestMixin, DeleteView):
    model = Projet
    success_url = '/'

    def test_func(self):
        projet = self.get_object()
        if self.request.user == projet.auteur:
            return True
        return False
