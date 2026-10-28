from django.shortcuts import render, redirect, get_object_or_404
from .models import Moto, Usuario, ReferenciaMoto, Orden, Repuesto, Servicio, OrdenRepuestos, OrdenServicio, Rol, Taller, TallerRepuestos, TallerServicio
from .forms import MotoForm, UsuarioForm, RepuestoForm, ServicioForm
import requests
from rest_framework import viewsets
from .serializers import OrdenSerializer
# Importamos el decorador de seguridad nativo de Django
from django.contrib.auth.decorators import login_required
from django.contrib.auth.hashers import make_password
from django.http import HttpResponse
import folium

def home(request):
    return render(request, 'index.html')

# ==================== CRUD MOTOS ====================
@login_required
def crear_Moto(request):
    if request.method == 'POST':
        form = MotoForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('listar_motos')
    else:
        form = MotoForm()
    return render(request, 'moto/crear.html', {'form': form})

@login_required
def editar_Moto(request, id_Moto):
    moto = get_object_or_404(Moto, id_moto=id_Moto)
    if request.method == 'POST':
        form = MotoForm(request.POST, instance=moto)
        if form.is_valid():
            form.save()
            return redirect('listar_motos')
    else:
        form = MotoForm(instance=moto)
    return render(request, 'moto/editar.html', {'form': form})

@login_required
def listar_Motos(request):
    motos = Moto.objects.all()
    return render(request, 'moto/listar.html', {'lista_objetos': motos})

@login_required
def eliminar_Moto(request, id_Moto):
    moto = get_object_or_404(Moto, id_moto=id_Moto)
    if request.method == 'POST':
        moto.delete()
        return redirect('listar_motos')
    return render(request, 'moto/eliminar.html', {'objeto': moto})


# ==================== CRUD USUARIOS ====================
@login_required
def crear_Usuario(request):
    if request.method == 'POST':
        form = UsuarioForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('listar_usuarios')
    else:
        form = UsuarioForm()
    return render(request, 'usuarios/crear.html', {'form': form})

@login_required
def editar_Usuario(request, id_usuario):
    usuario = get_object_or_404(Usuario, id_usuario=id_usuario)
    if request.method == 'POST':
        form = UsuarioForm(request.POST, instance=usuario)
        if form.is_valid():
            form.save()
            return redirect('listar_usuarios')
    else:
        form = UsuarioForm(instance=usuario)
    return render(request, 'usuarios/editar.html', {'form': form})

@login_required
def listar_Usuarios(request):
    usuarios = Usuario.objects.all()
    return render(request, 'usuarios/listar.html', {'lista_objetos': usuarios})

@login_required
def eliminar_Usuario(request, id_usuario):
    usuario = get_object_or_404(Usuario, id_usuario=id_usuario)
    if request.method == 'POST':
        usuario.delete()
        return redirect('listar_usuarios')
    return render(request, 'usuarios/eliminar.html', {'objeto': usuario})


# ==================== CRUD REPUESTOS ====================
@login_required
def crear_Repuesto(request):
    if request.method == 'POST':
        form = RepuestoForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('listar_repuestos')
    else:
        form = RepuestoForm()
    return render(request, 'repuesto/crear.html', {'form': form})

@login_required
def editar_Repuesto(request, id_repuesto):
    repuesto = get_object_or_404(Repuesto, id_repuesto=id_repuesto)
    if request.method == 'POST':
        form = RepuestoForm(request.POST, instance=repuesto)
        if form.is_valid():
            form.save()
            return redirect('listar_repuestos')
    else:
        form = RepuestoForm(instance=repuesto)
    return render(request, 'repuesto/editar.html', {'form': form})

@login_required
def listar_Repuestos(request):
    repuestos = Repuesto.objects.all()
    return render(request, 'repuesto/listar.html', {'lista_objetos': repuestos})

@login_required
def eliminar_Repuesto(request, id_repuesto):
    repuesto = get_object_or_404(Repuesto, id_repuesto=id_repuesto)
    if request.method == 'POST':
        repuesto.delete()
        return redirect('listar_repuestos')
    return render(request, 'repuesto/eliminar.html', {'objeto': repuesto})


# ==================== GESTIÓN DE ÓRDENES ====================
@login_required
def listar_Ordenes(request):
    ordenes = Orden.objects.all()
    return render(request, 'ordenes/listar.html', {'lista_objetos': ordenes})

@login_required
def listar_OrdenRepuestos(request):
    orden_repuestos = OrdenRepuestos.objects.all()
    return render(request, 'orden_repuestos/listar.html', {'lista_objetos': orden_repuestos})

@login_required
def listar_OrdenServicio(request):
    orden_servicios = OrdenServicio.objects.all()
    return render(request, 'orden_servicio/listar.html', {'lista_objetos': orden_servicios})
@login_required
def crear_Orden(request):
    from .forms import OrdenForm
    if request.method == 'POST':
        form = OrdenForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('listar_ordenes')
    else:
        form = OrdenForm()
    return render(request, 'ordenes/crear.html', {'form': form})

@login_required
def editar_Orden(request, id_orden):
    from .forms import OrdenForm
    orden = get_object_or_404(Orden, id_orden=id_orden)
    if request.method == 'POST':
        form = OrdenForm(request.POST, instance=orden)
        if form.is_valid():
            form.save()
            return redirect('listar_ordenes')
    else:
        form = OrdenForm(instance=orden)
    return render(request, 'ordenes/editar.html', {'form': form})

@login_required
def eliminar_Orden(request, id_orden):
    orden = get_object_or_404(Orden, id_orden=id_orden)
    if request.method == 'POST':
        orden.delete()
        return redirect('listar_ordenes')
    return render(request, 'ordenes/eliminar.html', {'objeto': orden})  


# ==================== REFERENCIAS Y ENTIDADES TABLAS RESTANTES ====================
@login_required
def listar_ReferenciaMotos(request):
    referencias = ReferenciaMoto.objects.all()
    return render(request, 'referencia_motos/listar.html', {'lista_objetos': referencias})

@login_required
def crear_ReferenciaMoto(request):
    from .forms import ReferenciaMotoForm
    if request.method == 'POST':
        form = ReferenciaMotoForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('listar_referencia_motos')
    else:
        form = ReferenciaMotoForm()
    return render(request, 'referencia_motos/crear.html', {'form': form})   

@login_required
def listar_Roles(request):
    roles = Rol.objects.all()
    return render(request, 'roles/listar.html', {'lista_objetos': roles})

@login_required
def crear_Rol(request):
    from .forms import RolForm
    if request.method == 'POST':
        form = RolForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('listar_roles')
    else:
        form = RolForm()
    return render(request, 'roles/crear.html', {'form': form})  

@login_required
def listar_Servicios(request):
    servicios = Servicio.objects.all()
    return render(request, 'servicios/listar.html', {'lista_objetos': servicios})

@login_required
def crear_Servicio(request):
    if request.method == 'POST':
        form = ServicioForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('listar_servicios')
    else:
        form = ServicioForm()
    return render(request, 'servicios/crear.html', {'form': form})

@login_required
def listar_Talleres(request):
    talleres = Taller.objects.all()
    return render(request, 'talleres/listar.html', {'lista_objetos': talleres})

@login_required
def crear_Taller(request):
    from .forms import TallerForm
    if request.method == 'POST':
        form = TallerForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('listar_talleres')
    else:
        form = TallerForm()
    return render(request, 'talleres/crear.html', {'form': form})

@login_required
def listar_TallerRepuestos(request):
    relaciones = TallerRepuestos.objects.all()
    return render(request, 'taller_repuesto/listar.html', {'lista_objetos': relaciones})

@login_required
def listar_TallerServicio(request):
    relaciones = TallerServicio.objects.all()
    return render(request, 'taller_servicio/listar.html', {'lista_objetos': relaciones})


# ==================== API Y CLIMA ====================
class OrdenViewSet(viewsets.ModelViewSet):
    """API para el enrutador de ordenes."""
    queryset = Orden.objects.all()
    serializer_class = OrdenSerializer

@login_required
def consultar_clima(request):
    """Consulta la API de Open-Meteo para Bogotá de forma correcta."""
    latitud = "4.6097"
    longitud = "-74.0817"
    
    # 1. Armamos la URL exacta con la versión v1/forecast y las variables requeridas
    url = f"https://open-meteo.com/v1/forecast?latitude={latitud}&longitude={longitud}&current=temperature_2m,wind_speed_10m"
    
    try:
        # 2. Hacemos la petición incluyendo un User-Agent básico para evitar bloqueos del servidor
        response = requests.get(url, headers={'User-Agent': 'Mozilla/5.0'}, timeout=5)
        datos_clima = response.json()
        
        # 3. Extraemos el bloque 'current' devuelto por la API
        tiempo_actual = datos_clima['current']
        
        # 4. Asignamos los datos con los nombres exactos que envía el servidor
        contexto = {
            'ciudad': 'Bogotá',
            'temperatura': tiempo_actual['temperature_2m'],
            'viento': tiempo_actual['wind_speed_10m'],
        }
        return render(request, 'clima.html', context=contexto)
        
    except Exception as e:
        # En caso de cualquier inconveniente, enviamos el mensaje controlado a la interfaz
        return render(request, 'clima.html', {'error': f"Error de conexión a la API: {str(e)}"})



# ==================== MAPAS (FOLIUM) ====================
@login_required
def ver_mapa(request):
    """Renderiza el mapa interactivo cargando los talleres desde MySQL."""
    if request.GET.get('render_map') == 'true':
        mapa_bogota = folium.Map(
            location=[4.63, -74.08], 
            zoom_start=12,
            control_scale=True
        )
        
        talleres_db = Taller.objects.all()
        
        for taller in talleres_db:
            latitud = getattr(taller, 'latitud', 4.63 + (taller.id_taller * 0.01))
            longitud = getattr(taller, 'longitud', -74.08 - (taller.id_taller * 0.005))
            
            contenido_popup = f"""
            <div style="font-family: 'Arial', sans-serif; min-width: 200px;">
                <h5 style="color: #007bff; margin-bottom: 5px;">🏪 {taller.nombre}</h5>
                <p style="margin: 0 0 5px 0; font-size: 13px; color: #333;"><b>📍 Dirección:</b> {taller.direccion}</p>
                <p style="margin: 0; font-size: 13px; color: #666;"><b>📞 Teléfono:</b> {taller.telefono}</p>
                <hr style="border-top: 1px solid #ccc; margin: 8px 0;">
                <span style="color: #ff3366; font-size: 11px; font-weight: bold;">🔧 Taller Autorizado MotoClick</span>
            </div>
            """
            
            folium.Marker(
                location=[latitud, longitud],
                popup=folium.Popup(contenido_popup, max_width=300),
                icon=folium.Icon(color='red', icon='wrench', prefix='fa')
            ).add_to(mapa_bogota)
            
        return HttpResponse(mapa_bogota._repr_html_())

    return render(request, 'mapa.html')


# ==================== AUTENTICACIÓN Y ROLES (CORREGIDO) ====================
def registrar_Usuario(request):
    """Permite a los nuevos clientes registrarse en Motoclick."""
    if request.method == 'POST':
        form = UsuarioForm(request.POST)
        if form.is_valid():
            nuevo_usuario = form.save(commit=False)
            nuevo_usuario.contrasena = make_password(form.cleaned_data['contrasena'])
            nuevo_usuario.save()
            return redirect('login')
    else:
        form = UsuarioForm()
    return render(request, 'usuarios/crear.html', {'form': form})

@login_required
def panel_control(request):
    """Renderiza el panel de control interno redirigiendo según el rol real."""
    # 🔥 CORREGIDO: Si es el superusuario o admin, lo mandamos a su menú principal (home.html)
    if request.user.is_superuser or request.user.is_staff:
        return render(request, 'home.html')
    
    try:
        usuario_db = Usuario.objects.get(correo_electronico=request.user.username)
        rol_usuario = usuario_db.id_rol_id
    except Usuario.DoesNotExist:
        rol_usuario = None 

    # Validamos las redirecciones por rol de base de datos
    if rol_usuario == 1:
        # 🔥 CORREGIDO: El administrador de la base de datos va a su menú principal (home.html)
        return render(request, 'home.html')     
    elif rol_usuario == 2:
        return render(request, 'panel_taller.html') 
    elif rol_usuario == 3:
        return redirect('mi_garaje')               
    else:
        return redirect('catalogo_publico_cliente')



@login_required
def mi_garaje_cliente(request):
    """Muestra y gestiona el garaje del cliente autenticado."""
    try:
        usuario_db = Usuario.objects.get(correo_electronico=request.user.username)
    except Usuario.DoesNotExist:
        return redirect('landing_page')

    if request.method == 'POST':
        placa = request.POST.get('placa')
        if placa:
            placa = placa.upper()
        id_referencia = request.POST.get('referencia_moto')
        
        if placa and id_referencia:
            referencia = ReferenciaMoto.objects.get(pk=id_referencia)
            nueva_moto = Moto(
                placa=placa,
                id_usuario=usuario_db,
                id_referencia_moto=referencia
            )
            nueva_moto.save()
            return redirect('mi_garaje')

    mis_motos = Moto.objects.filter(id_usuario=usuario_db)

    sugerencias_repuestos = []
    if mis_motos.exists():
        primera_moto = mis_motos.first()
        marca_moto = primera_moto.id_referencia_moto.marca
        sugerencias_repuestos = Repuesto.objects.filter(id_referencia_moto__marca__icontains=marca_moto)[:4]

    sugerencias_talleres = Taller.objects.all()[:3]
    todas_referencias = ReferenciaMoto.objects.all()

    contexto = {
        'mis_motos': mis_motos,
        'todas_referencias': todas_referencias,
        'sugerencias_repuestos': sugerencias_repuestos,
        'sugerencias_talleres': sugerencias_talleres,
    }
    return render(request, 'panel_cliente.html', contexto)

@login_required
def catalogo_publico_cliente(request):
    """Muestra el catálogo de repuestos seguro para los clientes (Vista Aranoz)."""
    todos_repuestos = Repuesto.objects.all()
    contexto = {
        'repuestos': todos_repuestos
    }
    return render(request, 'catalogo_cliente.html', contexto)
