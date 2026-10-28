from django.contrib import admin
from .models import (
    Moto, 
    Orden, 
    OrdenRepuestos, 
    OrdenServicio,
    ReferenciaMoto, 
    Repuesto, 
    Rol, 
    Servicio,
    Taller, 
    TallerRepuestos, 
    TallerServicio, 
    Usuario
)

# Registro de modelos en el panel de administración
admin.site.register(Moto)
admin.site.register(Orden)
admin.site.register(OrdenRepuestos)
admin.site.register(OrdenServicio)
admin.site.register(ReferenciaMoto)
admin.site.register(Repuesto)
admin.site.register(Rol)
admin.site.register(Servicio)
admin.site.register(Taller)
admin.site.register(TallerRepuestos)
admin.site.register(TallerServicio)
admin.site.register(Usuario)


