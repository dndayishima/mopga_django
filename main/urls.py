from django.urls import path
from . import views
from .views import ProjetListView, \
    ProjetDetailView, \
    ProjetCreateView, \
    ProjetUpdateView, \
    ProjetDeleteView, \
    UserProjetListView

urlpatterns = [
    path('', views.projetFinance, name='main-home'),
    path('privacy/', views.privacy, name='main-privacy'),
    path('search/', views.recherche, name='main-search'),
    path('projets', ProjetListView.as_view(), name='main-projets'),
    path('projet/<str:username>', UserProjetListView.as_view(), name='user-projets'),
    path('projet/<int:pk>/', ProjetDetailView.as_view(), name='projet-detail'),
    path('projet/new/', ProjetCreateView.as_view(), name='projet-create'),
    path('projet/<int:pk>/update/', ProjetUpdateView.as_view(), name='projet-update'),
    path('projet/<int:pk>/delete/', ProjetDeleteView.as_view(), name='projet-delete'),
    path('projet/<int:pk>/comment/', views.add_comment_to_projet, name='add_comment_to_projet'),
    path('projet/<int:pk>/financer/', views.financer_projet, name='financer_projet'),
    path('projet/<int:pk>/evaluer/', views.evaluer_projet, name='evaluer_projet'),
    path('about/', views.about, name='main-about'),
    path('contact/', views.contact, name='main-contact'),
]