from django.shortcuts import render, get_object_or_404
from .models import Salle

def home(request):
    list_salles = Salle.objects.all()
    context = {"listes_salles": list_salles}
    return render(request, 'index.html', context)

def about(request):
    return render(request, 'about.html')

def contact(request):
    return render(request, 'contact.html')

def search(request):
    query = request.GET.get('q')
    if query:
        results = Salle.objects.filter(nom_salle__icontains=query)
    else:
        results = Salle.objects.none()
    
    context = {
        'results': results,
        'query': query
    }
    return render(request, 'search_results.html', context)

def salle_detail(request, salle_id):
    salle = get_object_or_404(Salle, id=salle_id)
    return render(request, 'salle_detail.html', {'salle': salle})
