from django.contrib import admin
from .models import Projet, Commentaire, Financer, Evaluer

# Register your models here.
admin.site.register(Projet)
admin.site.register(Commentaire)
admin.site.register(Financer)
admin.site.register(Evaluer)
