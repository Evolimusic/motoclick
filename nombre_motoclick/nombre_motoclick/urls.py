"""
URL configuration for nombre_motoclick project.
"""
from django.contrib import admin
from django.urls import path, include
from motoclick import views 

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.home, name='home'), # Ruta Principal del proyecto
    
    # Redirige todo el tráfico de la app al archivo urls.py interno
    path('motoclick/', include('motoclick.urls')),
]


