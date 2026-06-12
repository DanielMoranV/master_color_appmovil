# MasterColor Soporte

Aplicación móvil (Flutter) de **soporte técnico y gestión de garantías** para MasterColor. Conecta a los **clientes** —que registran sus productos, consultan su garantía y abren tickets de soporte— con el **equipo técnico (staff)** —que gestiona la cola de tickets, agenda visitas, registra diagnósticos, repuestos y cotizaciones, y mide su desempeño mediante métricas y SLA.

La app consume una API REST (contrato OpenAPI) y se distribuye para **Android** e **iOS** desde una única base de código.

---

## Tabla de contenidos

- [Características](#características)
- [Arquitectura y stack](#arquitectura-y-stack)
- [Estructura del proyecto](#estructura-del-proyecto)
- [Requisitos previos](#requisitos-previos)
- [Instalación](#instalación)
- [Configuración del entorno](#configuración-del-entorno)
- [Ejecución en desarrollo](#ejecución-en-desarrollo)
- [Compilación de releases](#compilación-de-releases)
- [Notificaciones push (Firebase)](#notificaciones-push-firebase)
- [Cliente de API generado (OpenAPI)](#cliente-de-api-generado-openapi)
- [Calidad: análisis y pruebas](#calidad-análisis-y-pruebas)
- [Branding](#branding)
- [Solución de problemas](#solución-de-problemas)

---

## Características

La app tiene dos experiencias separadas por rol, gateadas en el routing tras el login.

### Cliente
- **Autenticación** con restauración de sesión y refresh automático de token.
- **Mis unidades**: catálogo de productos MasterColor comprados, con foto real, estado de garantía (vigente/vencida) y registro manual de nuevas unidades (producto, fecha de compra, serie y comprobante).
- **Tickets**: creación (general o vinculada a una unidad), conversación tipo chat con adjuntos (imágenes), seguimiento de estado e historial.
- **Tipo de servicio**: remoto, a domicilio o en taller, con selección de dirección.
- **Cierre de ticket**: calificar (1–5 estrellas + comentario) y reabrir con motivo.
- **Cotizaciones**: aprobar o rechazar cotizaciones emitidas por el staff.

### Staff (técnico)
- **Dashboard de métricas**: KPIs, distribución por estado y por técnico, con filtro por rango de fechas.
- **Cola de tickets** y **"Míos"**, con filtros por prioridad, categoría, estado y búsqueda.
- **Gestión del ticket**: asignar técnico, registrar diagnóstico (texto + repuestos), cambiar estado respetando la **máquina de estados** válida, notas internas y adjuntos.
- **Agenda y visitas**: programar visitas, check-in/check-out y acta de servicio con firma del cliente y fotos.
- **Repuestos**: búsqueda en stock y asociación al ticket.
- **Cotizaciones**: creación para aprobación del cliente.
- **Inventario de unidades**: búsqueda por serie, edición de serie/estado e historial de la unidad.
- **SLA**: tablero de cumplimiento y perfil de técnico (especialidad, zona, disponibilidad).

---

## Arquitectura y stack

| Capa | Tecnología |
|------|------------|
| UI / framework | Flutter (Dart, Material 3) |
| Gestión de estado | Riverpod 3 (`AsyncNotifier` + providers) |
| Navegación | go_router (rutas gateadas por rol) |
| Red HTTP | Dio + cliente OpenAPI generado |
| Persistencia segura | flutter_secure_storage (tokens) |
| Imágenes | image_picker, cached_network_image |
| Push | firebase_core, firebase_messaging |
| Otros | url_launcher, signature, intl |

**Patrón por feature** (`AsyncNotifier` + repositorios):

```
lib/features/<feature>/
├── <feature>_repository.dart   # Envuelve el cliente generado, traduce DioException → ApiException, desenvuelve `.data`
├── <feature>_controller.dart   # AsyncNotifierProvider (listas) + FutureProvider.family (detalles)
└── <feature>_screen.dart       # Consume con AsyncValue.when
```

La capa de red usa un envelope estándar `{ success, message, data, errors }`. Los errores se exponen al usuario vía `ApiException.displayMessage` (mensaje amigable, sin códigos técnicos). `lib/features/units/` es la referencia canónica del patrón.

---

## Estructura del proyecto

```
master_color_appmovil/
├── lib/
│   ├── main.dart              # Entry point (inicializa locale es, ProviderScope)
│   ├── app.dart               # MaterialApp.router + tema + push controller
│   ├── core/                  # Infraestructura transversal
│   │   ├── auth/              # Sesión, usuario actual, rol
│   │   ├── config/            # Env (base URL por --dart-define)
│   │   ├── network/           # ApiClient, ApiException
│   │   ├── pagination/        # PagedState / scroll infinito
│   │   ├── push/              # FCM (service, device repo, controller)
│   │   ├── router/            # go_router gateado por rol
│   │   ├── storage/           # Almacenamiento seguro
│   │   └── theme/             # Branding MasterColor
│   ├── features/             # addresses, agenda, auth, metrics, sla,
│   │                          #   staff_units, technician, tickets, units, visits
│   └── shared/widgets/        # Widgets reutilizables
├── packages/
│   └── mastercolor_api/       # Cliente Dart generado desde OpenAPI (ver README_REGEN.md)
├── docs/                      # PUSH_SETUP.md, BACKEND_REQUIREMENTS.md
├── assets/images/             # Logos e íconos (mc.png, mc_icon.png)
├── android/  ios/             # Proyectos nativos
└── pubspec.yaml
```

---

## Requisitos previos

| Herramienta | Versión recomendada |
|-------------|---------------------|
| Flutter SDK | **3.38.x** (canal stable) |
| Dart SDK | **≥ 3.10.1** (incluido con Flutter) |
| Android | Android Studio + SDK, JDK 17 |
| iOS | Xcode + CocoaPods (solo en macOS) |
| Node.js | Solo si vas a **regenerar** el cliente OpenAPI |

Verifica tu entorno con:

```bash
flutter doctor
```

---

## Instalación

```bash
# 1. Clonar el repositorio
git clone https://github.com/DanielMoranV/master_color_appmovil.git
cd master_color_appmovil

# 2. Descargar dependencias (resuelve también el paquete local mastercolor_api)
flutter pub get
```

> El paquete `packages/mastercolor_api` se referencia por `path:` en `pubspec.yaml`; `flutter pub get` lo enlaza automáticamente, no requiere pasos extra.

---

## Configuración del entorno

La URL base de la API se inyecta en tiempo de compilación con `--dart-define` (ver `lib/core/config/env.dart`).

| Entorno | Valor |
|---------|-------|
| **Producción** (por defecto) | `https://mc-api.djasoft.net.pe/api` |
| **Backend local** (emulador Android) | `http://10.0.2.2:8000/api` |

Sin flags, la app apunta a producción. Para apuntar a un backend local:

```bash
flutter run --dart-define=API_BASE_URL=http://10.0.2.2:8000/api
```

> En el emulador de Android, `localhost` del equipo anfitrión se accede como `10.0.2.2`.

---

## Ejecución en desarrollo

```bash
# Listar dispositivos / emuladores disponibles
flutter devices

# Ejecutar (hot reload activo)
flutter run

# Ejecutar contra un backend local
flutter run --dart-define=API_BASE_URL=http://10.0.2.2:8000/api
```

---

## Compilación de releases

### Android

```bash
# APK (instalación directa / distribución manual)
flutter build apk --release

# App Bundle (recomendado para Google Play)
flutter build appbundle --release
```

Artefactos:
- APK → `build/app/outputs/flutter-apk/app-release.apk`
- AAB → `build/app/outputs/bundle/release/app-release.aab`

> **Firma:** configura tu keystore en `android/key.properties` y `android/app/build.gradle` antes de publicar. Recuerda pasar `--dart-define=API_BASE_URL=...` si compilas contra un backend distinto al de producción.

### iOS (solo macOS)

```bash
cd ios && pod install && cd ..
flutter build ipa --release
```

Para subir a App Store/TestFlight, abre `ios/Runner.xcworkspace` en Xcode, configura el equipo de firma y archiva.

### Ícono de la app

El ícono de launcher se genera desde `assets/images/mc_icon.png`:

```bash
dart run flutter_launcher_icons
```

---

## Notificaciones push (Firebase)

La **capa de código de FCM está completa y es a prueba de fallos**: si Firebase no está configurado, el push queda inactivo y la app sigue funcionando con normalidad. Para activarlo solo falta la **configuración externa** (no requiere cambios de código):

```bash
flutterfire configure
```

Luego completa el setup nativo de Android/iOS. La guía detallada está en **[`docs/PUSH_SETUP.md`](docs/PUSH_SETUP.md)**.

---

## Cliente de API generado (OpenAPI)

El paquete `packages/mastercolor_api` es un cliente Dart **generado** desde el contrato OpenAPI del backend (`support-api.yaml`). **No se edita a mano** (salvo parches documentados).

Para regenerarlo tras un cambio de contrato, sigue **`packages/mastercolor_api/README_REGEN.md`**. En resumen:

```bash
npx @openapitools/openapi-generator-cli generate ...   # ver README_REGEN.md
```

> **Parches obligatorios post-regeneración** (documentados en `README_REGEN.md`): por ejemplo, `service_report_request.dart` requiere marcar el campo `photos` como `@JsonKey(ignore: true)`, y bumpear el SDK del paquete a `>=3.8.0`. Tras regenerar, vuelve a correr `flutter pub get`.

---

## Usuarios de prueba

Definidos en los seeders del backend. La contraseña es compartida por tipo de usuario.

### Cliente (`TestClientSeeder.php`)

`is_test = true` — los pagos se simulan si `MERCADOPAGO_ALLOW_SIMULATION` está activo.

| Campo | Valor |
|-------|-------|
| Email | `cliente.test@mastercolor.com` |
| Password | `cliente1234` |
| DNI | `70000001` |
| Teléfono | `910000001` |

### Técnicos (`TecnicosDePruebaSeeder.php`)

Rol **Técnico**, password compartida `tecnico1234`.

| Nombre | Email | DNI | Teléfono |
|--------|-------|-----|----------|
| Carlos Técnico | `tecnico1@mastercolor.com` | `80000001` | `900000001` |
| Lucía Técnica | `tecnico2@mastercolor.com` | `80000002` | `900000002` |

---

## Calidad: análisis y pruebas

```bash
# Análisis estático (debe quedar limpio)
flutter analyze

# Formateo
dart format .

# Pruebas
flutter test
```

---

## Branding

Tema definido en `lib/core/theme/app_theme.dart`:

- **Navy** `#1A4F8B` — primario (AppBar, FAB, botones)
- **Gold** `#F0A830` — secundario
- **Red** `#C8102E` — terciario
- Botones rellenos con radio 12. Logo `assets/images/mc.png`.
- Nombre de la app: **MasterColor Soporte**.

---

## Solución de problemas

| Síntoma | Causa / solución |
|---------|------------------|
| `flutter pub get` falla por `mastercolor_api` | Verifica que `packages/mastercolor_api` exista; el `path:` del pubspec es relativo a la raíz. |
| 401 en todas las llamadas | Token vencido o backend incorrecto; revisa `--dart-define=API_BASE_URL` y vuelve a iniciar sesión. |
| `No se pudo conectar con el servidor` | El emulador/dispositivo no alcanza la API. Usa `10.0.2.2` (no `localhost`) en el emulador Android. La red HTTPS del emulador puede cortarse de forma intermitente (errno 103) — es del emulador, no de la app. |
| Push no llega | Falta `flutterfire configure` + setup nativo; ver `docs/PUSH_SETUP.md`. |
| Errores raros tras regenerar el cliente | Reaplica los parches de `README_REGEN.md` y corre `flutter pub get`. |

---

Proyecto privado de MasterColor — `publish_to: none`.
