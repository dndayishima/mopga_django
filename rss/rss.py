from django.contrib.syndication.views import Feed
from django.urls import reverse
from main.models import Projet


class LastestProjectsFeed(Feed):
    title = 'DiVY web application'
    link = 'http://127.0.0.1:8000/'
    description = 'Participer au financement et evaluation des projets'

    def items(self):
        return Projet.objects.all().order_by('-id')[:10]

    def item_title(self, item):
        return item.intitule

    def item_description(self, item):
        return item.description

    def item_link(self, item):
        return ''
