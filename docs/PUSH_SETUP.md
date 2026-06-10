# Activación de Push / FCM

La capa de código de notificaciones (`lib/core/push/`) ya está implementada y es
**guarda-segura**: mientras Firebase no esté configurado, `PushService.initialize()`
falla de forma controlada y la app funciona con normalidad. Estos pasos activan la
integración real sin tocar código.

## 1. Instalar las CLIs (una vez)

```bash
dart pub global activate flutterfire_cli
npm install -g firebase-tools   # o el método que prefieras
firebase login
```

## 2. Configurar el proyecto Firebase

Desde la raíz del proyecto Flutter:

```bash
flutterfire configure
```

Esto:
- Crea/asocia el proyecto Firebase.
- Genera `lib/firebase_options.dart`.
- Descarga `android/app/google-services.json` y
  `ios/Runner/GoogleService-Info.plist`.

> Si usas `firebase_options.dart`, cambia en `push_service.dart` la llamada
> `Firebase.initializeApp()` por
> `Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)`.

## 3. Android

- En `android/app/build.gradle` (o `build.gradle.kts`) aplica el plugin:
  `id "com.google.gms.google-services"`.
- En el `build.gradle` raíz añade el classpath
  `com.google.gms:google-services` (si usas el sistema antiguo de plugins).
- `minSdkVersion` ≥ 21.
- Para canal de notificaciones en primer plano (opcional) añade
  `flutter_local_notifications`.

## 4. iOS

- Sube una **APNs Authentication Key** (.p8) en la consola de Firebase
  (Project Settings → Cloud Messaging).
- En Xcode, target Runner → Signing & Capabilities: añade
  **Push Notifications** y **Background Modes → Remote notifications**.

## 5. Verificar

1. `flutter run` en un dispositivo físico (el emulador iOS no recibe push).
2. Inicia sesión → en logs debe aparecer el token y registrarse en el backend
   (`POST /client/devices` o `/support/devices`).
3. Envía una notificación de prueba desde la consola de Firebase con
   `data: { "ticket_id": "123", "type": "ticket_message" }` y verifica el
   deep-link al detalle del ticket.

## Contrato con el backend

- Registro: `POST /client/devices` · `POST /support/devices`
  con `{ token, platform }` (`platform` ∈ `android|ios`).
- Baja: `DELETE /client/devices/{token}` · `DELETE /support/devices/{token}`.
- Payload `data` para deep-link:
  `{ "ticket_id": "123", "type": "ticket_status|ticket_message|ticket_assigned" }`.
