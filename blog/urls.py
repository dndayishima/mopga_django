from django.urls import path
from . import views
from .views import ProjetListView, ProjetDetailView, ProjetCreateView, ProjetUpdateView, ProjetDeleteView, UserProjetListView

urlpatterns = [
    path('', ProjetListView.as_view(), name='blog-home'),
    path('projet/<str:username>', UserProjetListView.as_view(), name='user-projets'),
    path('projet/<int:pk>/', ProjetDetailView.as_view(), name='projet-detail'),
    path('projet/new/', ProjetCreateView.as_view(), name='projet-create'),
    path('projet/<int:pk>/update/', ProjetUpdateView.as_view(), name='projet-update'),
    path('projet/<int:pk>/delete/', ProjetDeleteView.as_view(), name='projet-delete'),
    path('about/', views.about, name='blog-about'),
]