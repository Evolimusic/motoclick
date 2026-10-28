from django.contrib.auth.backends import BaseBackend
from django.contrib.auth.models import User
from django.contrib.auth.hashers import check_password
from .models import Usuario

class MotoClickAuthBackend(BaseBackend):
    def authenticate(self, request, username=None, password=None, **kwargs):
        # Django envía el dato del formulario web en el parámetro 'username'
        email = username 
        try:
            # 1. Buscamos al usuario en tu tabla de MySQL usando el modelo de tu models.py
            user_mysql = Usuario.objects.get(correo_electronico=email)
            
            # 2. Comparamos la clave encriptada (formato pbkdf2_sha256)
            if check_password(password, user_mysql.contrasena):
                
                # 3. Creamos o recuperamos el usuario de sesión de Django
                user, created = User.objects.get_or_create(
                    username=user_mysql.correo_electronico,
                    defaults={'email': user_mysql.correo_electronico}
                )
                
                # Sincronizamos nombres y apellidos reales desde la base de datos
                user.first_name = user_mysql.nombre
                user.last_name = user_mysql.apellido
                
                # 4. Evaluación del rol del usuario (Llave foránea en tu modelo)
                # Nota técnica: Django mapea la FK como un objeto, accedemos mediante 'id_rol'
                if user_mysql.id_rol and user_mysql.id_rol.codigo.lower() == 'admin':
                    user.is_staff = True
                    user.is_superuser = True
                else:
                    user.is_staff = False
                    user.is_superuser = False
                
                user.save()
                return user
        except Usuario.DoesNotExist:
            return None

    def get_user(self, user_id):
        try:
            return User.objects.get(pk=user_id)
        except User.DoesNotExist:
            return None
