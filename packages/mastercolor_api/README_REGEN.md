# Regenerar el cliente `mastercolor_api`

Paquete **generado** desde el contrato OpenAPI del backend. No editar a mano:
cualquier cambio se hace en el contrato y se regenera.

- **Contrato (fuente de verdad)**: `../../../master_color_api/docs/openapi/support-api.yaml`
- **Generador**: `dart-dio` con serialización `json_serializable` (no built_value).

## Pasos

Desde la raíz de la app (`master_color_app/`):

```bash
# 1. Regenerar el código desde el contrato
npx @openapitools/openapi-generator-cli generate \
  -i ../master_color_api/docs/openapi/support-api.yaml \
  -g dart-dio \
  -o packages/mastercolor_api \
  --additional-properties=pubName=mastercolor_api,serializationLibrary=json_serializable

# 2. Reaplicar el SDK mínimo (el generador lo pone en >=3.5.0; el código usa
#    null-aware-elements, que requiere >=3.8.0). Editar packages/mastercolor_api/pubspec.yaml:
#      environment: sdk: '>=3.8.0 <4.0.0'

# 3. Generar los serializadores .g.dart
cd packages/mastercolor_api
flutter pub get
dart run build_runner build --delete-conflicting-outputs
cd ../..
flutter pub get
```

## Notas / decisiones

- Se eligió `serializationLibrary=json_serializable` porque `built_value`
  (default de dart-dio) no soporta los campos `data`/`errors` del envelope.
- El contrato tenía `errors: { type: 'null' }` en `ApiSuccess` y `data: { type: 'null' }`
  en `ValidationError`, que generaban un tipo sintético `ModelNull` no deserializable.
  Se normalizaron a `nullable: true` en el contrato del backend.
- Tras regenerar hay que **reaplicar el bump de SDK** (paso 2): el generador
  sobrescribe `pubspec.yaml`.
- El cliente se integra con el Dio autenticado de la app vía
  `lib/core/network/mastercolor_api_provider.dart` (hereda auth + refresh).
- **Parche post-regen obligatorio** (`lib/src/model/service_report_request.dart`):
  el campo `photos` se genera como `List<MultipartFile>` con un `@JsonKey` normal,
  y `json_serializable` no puede generar `fromJson` para `MultipartFile` → falla el
  build_runner. Cambiar su anotación a `@JsonKey(ignore: true)` (igual que
  `clientSignatureFile`); las fotos viajan por multipart, no por JSON.
