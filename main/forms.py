from django import forms
from .models import Commentaire, Financer, Evaluer

"""
Form d'ajout d'un commentaire
"""
class CommentForm(forms.ModelForm):

    class Meta:
        model = Commentaire
        fields = ['contenu']


"""
Form d'ajout d'un montant pour financer un projet
"""
class FinancerForm(forms.ModelForm):

    class Meta:
        model = Financer
        fields = ['montant']


"""
Form d'ajout d'une note pour evaluer un projet
"""
class EvaluerForm(forms.ModelForm):

    class Meta:
        model = Evaluer
        fields = ['note_projet']


"""
Contact Form
"""
class ContactForm(forms.Form):
    from_email = forms.EmailField(required=True)
    subject = forms.CharField(required=True)
    message = forms.CharField(widget=forms.Textarea, required=True)
