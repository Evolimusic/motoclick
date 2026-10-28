from django.urls import path, include
from motoclick import views
from rest_framework.routers import DefaultRouter
# Importamos las vistas de autenticación nativas de Django
from django.contrib.auth import views as auth_views

# Configuramos el enrutador de la API
router = DefaultRouter()
router.register(r'ordenes', views.OrdenViewSet)

urlpatterns = [
    path('', views.home, name='landing_page'),
    path('panel/', views.panel_control, name='panel_control'),
    
    # === SISTEMA DE AUTENTICACIÓN WEB ===
    path('login/', auth_views.LoginView.as_view(), name='login'),
    path('logout/', auth_views.LogoutView.as_view(), name='logout'),
    path('registro/', views.registrar_Usuario, name='registro'),
    
    # === NUEVA RUTA: GARAJE VIRTUAL DEL CLIENTE ===
    path('mi-garaje/', views.mi_garaje_cliente, name='mi_garaje'),


    # === RUTAS PARA MOTO ===
    path('listar_Motos/', views.listar_Motos, name="listar_motos"),
    path('crear_Moto/', views.crear_Moto, name="crear_moto"),
    path('eliminar_Moto/<int:id_Moto>/', views.eliminar_Moto, name="eliminar_moto"),
    path('editar_Moto/<int:id_Moto>/', views.editar_Moto, name="editar_moto"),
    
    # API y herramientas
    path('api/', include(router.urls)),
    path('clima/', views.consultar_clima, name="consultar_clima"),
    path('mapa/', views.ver_mapa, name="ver_mapa"),


    # === CRUD USUARIOS ===
    path('listar_Usuarios/', views.listar_Usuarios, name="listar_usuarios"),
    path('crear_Usuario/', views.crear_Usuario, name="crear_usuario"),
    path('editar_Usuario/<int:id_usuario>/', views.editar_Usuario, name="editar_usuario"),
    path('eliminar_Usuario/<int:id_usuario>/', views.eliminar_Usuario, name="eliminar_usuario"),

        # === CRUD REPUESTOS ===
    path('listar_Repuestos/', views.listar_Repuestos, name='listar_repuestos'),
    path('crear_Repuesto/', views.crear_Repuesto, name='crear_repuesto'),
    path('editar_Repuesto/<int:id_repuesto>/', views.editar_Repuesto, name='editar_repuesto'),
    path('eliminar_Repuesto/<int:id_repuesto>/', views.eliminar_Repuesto, name='eliminar_repuesto'),
    
    # LINEA DEL CATÁLOGO PÚBLICO SEGURO PARA CLIENTES
    path('catalogo-repuestos/', views.catalogo_publico_cliente, name='catalogo_cliente'),




    # === CRUD ÓRDENES ===
    path('listar_Ordenes/', views.listar_Ordenes, name="listar_ordenes"),
    path('crear_Orden/', views.crear_Orden, name="crear_orden"),
    path('editar_Orden/<int:id_orden>/', views.editar_Orden, name="editar_orden"),
    path('eliminar_Orden/<int:id_orden>/', views.eliminar_Orden, name="eliminar_orden"),

    # === CRUD ORDEN REPUESTOS ===
    path('listar_OrdenRepuestos/', views.listar_OrdenRepuestos, name="listar_orden_repuestos"),
    
    # === CRUD ORDEN SERVICIO ===
    path('listar_OrdenServicio/', views.listar_OrdenServicio, name="listar_orden_servicio"),

    
    # === CRUD REFERENCIA MOTO ===
    path('listar_ReferenciaMotos/', views.listar_ReferenciaMotos, name="listar_referencia_motos"),
    path('crear_ReferenciaMoto/', views.crear_ReferenciaMoto, name="crear_referencia_moto"),
    # === CRUD ROL ===
    path('listar_Roles/', views.listar_Roles, name="listar_roles"),
    path('crear_Rol/', views.crear_Rol, name="crear_rol"),
    # === CRUD SERVICIO ===
    path('listar_Servicios/', views.listar_Servicios, name="listar_servicios"),
    path('crear_Servicio/', views.crear_Servicio, name="crear_servicio"),
    # === CRUD TALLER ===
    path('listar_Talleres/', views.listar_Talleres, name="listar_talleres"),
    path('crear_Taller/', views.crear_Taller, name="crear_taller"),
    # === CRUD TABLAS RELACIONALES INTERMEDIAS ===
    path('listar_TallerRepuestos/', views.listar_TallerRepuestos, name="listar_taller_repuestos"),
    path('listar_TallerServicio/', views.listar_TallerServicio, name="listar_taller_servicio"),
]
