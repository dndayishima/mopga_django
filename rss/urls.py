from django.urls import path
from .rss import LastestProjectsFeed


urlpatterns = [
    path('', LastestProjectsFeed(), name='rss'),
]