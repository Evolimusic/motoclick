from django import forms
from .models import Moto, Usuario, ReferenciaMoto, Orden, Repuesto, Rol, Servicio, Taller

class MotoForm(forms.ModelForm):
    class Meta:
        model = Moto
        fields = [ 'placa', 'id_usuario', 'id_referencia_moto']
        labels = {
            'placa': 'Placa',
            'id_usuario': 'Usuario',
            'id_referencia_moto': 'Referencia de la Moto',
        }

class UsuarioForm(forms.ModelForm):
    class Meta:
        model = Usuario
        fields = '__all__'
        labels = {
            'nombre': 'Nombre',
            'email': 'Email',
            'telefono': 'Teléfono',
        }
        exclude = ['estado'] # ❌ Quita el campo estado del formulario

class ReferenciaMotoForm(forms.ModelForm):
    class Meta:
        model = ReferenciaMoto
        fields = '__all__'
        labels = {
            'marca': 'Marca',
            'modelo': 'Modelo',
            'anio': 'Año',
        }

class OrdenForm(forms.ModelForm):
    class Meta:
        model = Orden
        fields = '__all__'
        exclude = ['estado'] # ❌ Quita el campo estado del formulario

class RepuestoForm(forms.ModelForm):
    class Meta:
        model = Repuesto
        fields = '__all__'
        exclude = ['estado'] # ❌ Quita el campo estado del formulario

class RolForm(forms.ModelForm):
    class Meta:
        model = Rol
        fields = '__all__'

class ServicioForm(forms.ModelForm):
    class Meta:
        model = Servicio
        fields = '__all__'

class TallerForm(forms.ModelForm):
    class Meta:
        model = Taller
        fields = '__all__'

