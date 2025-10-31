from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from gestion.views import home, about, contact,search,salle_detail

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', home, name='home'),
    path('about/', about, name='about'),
    path('contact/', contact, name='contact'),
    path('search/', search, name='search'),
    path('salle/<int:salle_id>/', salle_detail, name='salle_detail'),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
