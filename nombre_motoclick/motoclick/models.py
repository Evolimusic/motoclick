# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Moto(models.Model):
    id_moto = models.AutoField(primary_key=True)
    placa = models.CharField(unique=True, max_length=10)
    id_usuario = models.ForeignKey('Usuario', models.DO_NOTHING, db_column='id_usuario')
    id_referencia_moto = models.ForeignKey('ReferenciaMoto', models.DO_NOTHING, db_column='id_referencia_moto')

    class Meta:
        managed = False
        db_table = 'moto'
    def __str__(self):
        return f"placa: {self.placa}"
    
   
class Orden(models.Model):
    id_orden = models.AutoField(primary_key=True)
    id_moto = models.ForeignKey(Moto, models.DO_NOTHING, db_column='id_moto')
    fecha = models.DateTimeField(blank=True, null=True)
    observacion = models.CharField(max_length=500, blank=True, null=True)
    estado = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'orden'


class OrdenRepuestos(models.Model):
    id_orden_repuesto = models.AutoField(primary_key=True)
    id_orden = models.ForeignKey(Orden, models.DO_NOTHING, db_column='id_orden')
    id_taller_repuesto = models.ForeignKey('TallerRepuestos', models.DO_NOTHING, db_column='id_taller_repuesto')
    cantidad = models.IntegerField()
    precio_unitario = models.DecimalField(max_digits=10, decimal_places=2)

    class Meta:
        managed = False
        db_table = 'orden_repuestos'


class OrdenServicio(models.Model):
    id_orden_servicio = models.AutoField(primary_key=True)
    id_orden = models.ForeignKey(Orden, models.DO_NOTHING, db_column='id_orden')
    id_taller_servicio = models.ForeignKey('TallerServicio', models.DO_NOTHING, db_column='id_taller_servicio')
    observacion = models.CharField(max_length=500, blank=True, null=True)
    estado = models.CharField(max_length=10, blank=True, null=True)
    adicional = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'orden_servicio'


class ReferenciaMoto(models.Model):
    id_referencia_moto = models.AutoField(primary_key=True)
    marca = models.CharField(max_length=100)
    modelo = models.CharField(max_length=100)
    cilindraje = models.IntegerField()
    tipo_moto = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'referencia_moto'

    def __str__(self):
        return f"{self.marca} {self.modelo} ({self.cilindraje}cc)"  # Retorna una representación legible de la referencia de la moto


class Repuesto(models.Model):
    id_repuesto = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=100)
    marca = models.CharField(max_length=100, blank=True, null=True)
    tipo_repuesto = models.CharField(max_length=100, blank=True, null=True)
    descripcion = models.CharField(max_length=500, blank=True, null=True)
    precio = models.DecimalField(max_digits=10, decimal_places=2)
    estado = models.IntegerField(blank=True, null=True)
    id_referencia_moto = models.ForeignKey(ReferenciaMoto, models.DO_NOTHING, db_column='id_referencia_moto', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'repuesto'


class Rol(models.Model):
    id_rol = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=20)
    codigo = models.CharField(unique=True, max_length=10)

    class Meta:
        managed = False
        db_table = 'rol'
    def __str__(self):
            return self.nombre  # Retorna el nombre del rol como representación de la instancia


class Servicio(models.Model):
    id_servicio = models.AutoField(primary_key=True)
    nombre_servicio = models.CharField(max_length=30)
    descripcion = models.CharField(max_length=200, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'servicio'


class Taller(models.Model):
    id_taller = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=100)
    direccion = models.CharField(max_length=100, blank=True, null=True)
    telefono = models.CharField(max_length=20, blank=True, null=True)
    correo_electronico = models.CharField(max_length=150, blank=True, null=True)
    id_usuario = models.ForeignKey('Usuario', models.DO_NOTHING, db_column='id_usuario')

    class Meta:
        managed = False
        db_table = 'taller'


class TallerRepuestos(models.Model):
    id_taller_repuesto = models.AutoField(primary_key=True)
    id_taller = models.ForeignKey(Taller, models.DO_NOTHING, db_column='id_taller')
    id_repuesto = models.ForeignKey(Repuesto, models.DO_NOTHING, db_column='id_repuesto')
    precio = models.DecimalField(max_digits=10, decimal_places=2)
    cantidad = models.IntegerField(blank=True, null=True)
    estado = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'taller_repuestos'


class TallerServicio(models.Model):
    id_taller_servicio = models.AutoField(primary_key=True)
    id_taller = models.ForeignKey(Taller, models.DO_NOTHING, db_column='id_taller')
    id_servicio = models.ForeignKey(Servicio, models.DO_NOTHING, db_column='id_servicio')
    nombre_personalizado = models.CharField(max_length=150)
    precio = models.DecimalField(max_digits=10, decimal_places=2)

    class Meta:
        managed = False
        db_table = 'taller_servicio'


class Usuario(models.Model):
    id_usuario = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=100)
    apellido = models.CharField(max_length=100)
    tipo_documento = models.CharField(max_length=20)
    numero_documento = models.CharField(unique=True, max_length=20)
    correo_electronico = models.CharField(unique=True, max_length=150)
    contrasena = models.CharField(max_length=255)
    telefono = models.CharField(max_length=20, blank=True, null=True)
    fecha_registro = models.DateTimeField(blank=True, null=True)
    estado = models.IntegerField(blank=True, null=True)
    id_rol = models.ForeignKey(Rol, models.DO_NOTHING, db_column='id_rol')

    class Meta:
        managed = False
        db_table = 'usuario'
    
    def __str__(self):
        return self.nombre  # Retorna el nombre del usuario como representación de la instancia

        from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from django.contrib import messages

def iniciar_sesion(request):
    if request.method == 'POST':
        # Captura lo que el usuario escribe en el formulario HTML
        correo = request.POST.get('correo')        
        clave = request.POST.get('contrasena')     
        
        # Ejecuta la validación automática con tu base de datos MySQL
        user = authenticate(request, username=correo, password=clave)
        
        if user is not None:
            login(request, user)
            if user.is_superuser:
                # Si es administrador, va directo a la vista del panel
                return redirect('panel_cliente')   
            return redirect('home')  # Si es cliente común, va al inicio
        else:
            messages.error(request, "Correo electrónico o contraseña incorrectos.")
            return render(request, 'login.html')  # Asegúrate de poner el nombre de tu archivo HTML de login
            
    return render(request, 'login.html')

