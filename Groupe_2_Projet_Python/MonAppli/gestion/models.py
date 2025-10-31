from django.db import models
from datetime import date

class Salle(models.Model):
    nom_salle = models.CharField(max_length=50)
    description = models.TextField()
    image = models.ImageField(upload_to="media/", default='path/to/default/image.jpg')
    date_publication = models.DateField(default=date.today)
    disponible = models.CharField(max_length=4, default='oui', choices=[('oui', 'oui'), ('non', 'non')])
    upload_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.nom_salle
