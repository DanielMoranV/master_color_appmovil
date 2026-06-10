# Requerimiento al backend — App de Soporte Técnico (campo + remoto)

## Contexto
La app móvil de soporte ya cubre el ciclo base (cliente abre ticket → técnico
asigna/diagnostica/resuelve → cliente califica/reabre). Al analizarla para
**operación real de soporte técnico** (incluyendo **visitas a domicilio**)
encontramos gaps importantes: el técnico no tiene la **dirección ni ubicación**
del cliente, no hay **agenda de visitas**, ni **reporte de servicio con firma**,
ni vínculo de **repuestos** con el inventario existente.

Convención: mantener el envelope actual
`{ success, message, status, data, pagination, errors }`, snake_case, URLs
absolutas, fechas ISO-8601. Al actualizar `docs/openapi/support-api.yaml`
regeneramos el cliente Dart.

Prioridades: 🔴 bloqueante · 🟡 importante · 🔵 deseable.

---

## 🔴 BLOQUE 0 — Exponer datos que el backend YA produce (solo contrato)

### 0.1 Bloque `client` en el detalle del ticket
`SupportTicketResource` ya incluye `client {id,name,email,phone}` con
`whenLoaded`, y el controller `show` hace `with('client')`. **Pero el schema
`SupportTicketDetail` del contrato NO lo declara**, así que la app no lo recibe.
→ Agregar `client` (y `rating_comment`, que también falta) a `SupportTicketDetail`
y a `SupportTicket` (para la cola):

```json
"client": { "id": 12, "name": "ACME S.A.C.", "email": "...", "phone": "910000001" },
"rating_comment": "Excelente atención"
```

**Impacto:** sin esto el técnico no ve a quién/qué teléfono está atendiendo.

---

## 🔴 BLOQUE 1 — Visita a domicilio: dirección + ubicación

### 1.1 Dirección del servicio en el ticket
Hoy `addresses` existe (a nivel cliente) pero **no se vincula al ticket** ni se
expone al técnico. Necesitamos:

- Campo `service_address_id` en `support_tickets` (FK a `addresses`, nullable —
  solo para servicios a domicilio). Lo elige el cliente al crear el ticket.
- Exponer en `SupportTicket`/`SupportTicketDetail` un objeto `service_address`:

```json
"service_address": {
  "id": 16,
  "address_full": "Av. Prueba 123",
  "district": "Lima", "province": "Lima", "department": "Lima",
  "postal_code": "15001", "reference": "Puerta azul",
  "latitude": -12.0464, "longitude": -77.0428
}
```

### 1.2 Geolocalización en direcciones (lat/lng)
La tabla `addresses` **no tiene coordenadas**. Sin lat/lng no podemos abrir
navegación turn-by-turn ni mostrar el pin exacto.
→ Agregar `latitude` y `longitude` (decimal, nullable) a `addresses` y a
`AddressResource`. Idealmente geocodificar al guardar; si no, que la app permita
capturarlas.

- **Uso en app:** botón "Cómo llegar" → abre Google Maps/Waze con
  `geo:lat,lng` o dirección; y un mapa embebido con el pin.

### 1.3 Endpoint para listar direcciones del cliente (al crear ticket)
Para que el cliente elija a qué dirección va el técnico:
`GET /client/addresses` (ya existe `ClientAddressController` — confirmar que
está expuesto en el contrato y devuelve lat/lng).

---

## 🔴 BLOQUE 2 — Tipo de servicio (remoto vs domicilio)

Hoy no se distingue. Para enrutar el flujo:
- Campo `service_type` en `support_tickets`: enum `remoto | domicilio | taller`.
  Lo define el cliente al crear (o el staff al triagear).
- Exponerlo en los recursos. Si `domicilio` → `service_address` es obligatorio.

---

## 🟡 BLOQUE 3 — Agenda / programación de visitas

No existe ninguna tabla de citas. El técnico de campo necesita una agenda.

### 3.1 Programar visita
`PATCH /support/tickets/{id}/schedule`
```json
{ "scheduled_at": "2026-06-10T15:00:00Z", "scheduled_window_minutes": 60, "note": "..." }
```
- Agregar `scheduled_at` (datetime, nullable) y `scheduled_window_minutes`
  a `support_tickets` (o tabla `ticket_appointments` si se quiere histórico de
  reprogramaciones).
- Exponer `scheduled_at` en los recursos.

### 3.2 Mi agenda del día
`GET /support/tickets/agenda?date=YYYY-MM-DD` → tickets del técnico autenticado
con visita ese día, ordenados por hora (idealmente con la dirección incluida
para armar la ruta).

- **Uso en app:** vista calendario/lista "Hoy", recordatorios push antes de la cita.

---

## 🟡 BLOQUE 4 — Ejecución en sitio: check-in/out y evidencia

### 4.1 Check-in / check-out con geolocalización
`POST /support/tickets/{id}/check-in`  · `POST /support/tickets/{id}/check-out`
```json
{ "latitude": -12.046, "longitude": -77.042, "at": "2026-06-10T15:05:00Z" }
```
- Permite registrar llegada/salida, calcular **tiempo en sitio** y verificar que
  el técnico estuvo en la ubicación. Nueva tabla `ticket_visits`
  (ticket_id, technician_id, checkin_at, checkin_lat/lng, checkout_at, ...).

### 4.2 Reporte de servicio / orden de trabajo con firma de conformidad
Cierre formal de una visita a domicilio:
`POST /support/tickets/{id}/service-report`
```json
{
  "work_done": "Se reemplazó el fusor...",
  "parts": [ { "stock_id": 5, "qty": 1 } ],
  "client_signature": "<imagen base64 o multipart>",
  "client_signed_name": "Juan Pérez",
  "photos": [ "<multipart files>" ]
}
```
- Genera un **acta firmada** (PDF idealmente) y deja constancia de conformidad.
- **Uso en app:** ya tenemos captura de firma e imágenes; falta el endpoint.

---

## 🟡 BLOQUE 5 — Repuestos vinculados al inventario

Existe `stocks` / `stock_movements`, pero `parts_used` del ticket es **texto
libre** (no descuenta stock ni se trazabiliza).

- Tabla `ticket_parts` (ticket_id, stock_id, qty, unit_cost) para registrar
  repuestos consumidos por ticket → que descuente `stock_movements`.
- `GET /support/parts?search=` para buscar repuestos del inventario al
  diagnosticar.
- `POST /support/tickets/{id}/parts` para registrar consumo.
- Exponer `parts: [{stock_id, name, sku, qty, unit_cost}]` en el detalle.

---

## 🟡 BLOQUE 6 — Presupuesto / costo / aprobación (fuera de garantía)

Cuando NO hay garantía, suele requerirse cotización y aprobación del cliente.
- Campos/tabla de presupuesto: `labor_cost`, `parts_cost`, `total`, `currency`,
  `quote_status` (`pendiente|aprobado|rechazado`).
- `POST /support/tickets/{id}/quote` (técnico crea) →
  `POST /client/support/tickets/{id}/quote/approve|reject` (cliente decide).
- Estado de ticket sugerido: `en_espera_aprobacion`.

---

## 🟡 BLOQUE 7 — Validaciones de negocio (correcciones)

Detectadas al revisar `SupportTicketService.php`:

1. **Reasignar no valida rol Técnico** — `assigned_user_id` solo usa
   `exists:users,id`. Se puede asignar a un cliente/admin. → Validar que el
   usuario tenga rol **Tecnico** y esté activo. Ideal: `GET /support/technicians`
   ya filtra; aplicar la misma regla en `assign`.
2. **Assign y diagnosis se permiten en tickets terminales** (cerrado/cancelado).
   → Rechazar `assign`/`diagnosis`/`status` sobre estados terminales (422).
3. **Diagnóstico se sobrescribe sin control de estado.** Definir si debe poder
   editarse tras `resuelto` (hoy sí, sin auditoría de "edición"). Recomendado:
   permitir editar solo hasta `cerrado`, y dejar traza.
4. Confirmar/documentar la regla `en_espera_cliente → resuelto` no permitida
   (la app ya solo ofrece transiciones válidas; mantener consistencia).

---

## 🔵 BLOQUE 8 — Perfil del técnico (asignación inteligente)

- Extender `users` (técnicos) con: `specialties` (categorías que atiende),
  `coverage_zones` (distritos/zonas), `is_available`.
- `GET /support/technicians` que devuelva esos campos → permite sugerir el
  técnico adecuado por zona/especialidad al asignar visitas.

---

## 🔵 BLOQUE 9 — SLA, notificaciones e historial

- **SLA:** ya existe `sla_due_at`. Falta endpoint/flag de **tickets vencidos o
  por vencer** y, mejor aún, notificaciones de escalamiento.
- **Push/FCM:** endpoints de registro ya existen; pendiente activar el envío real
  desde los eventos (`TicketAssigned`, `TicketStatusChanged`, nuevo mensaje,
  recordatorio de cita). Payload con `ticket_id` + `type` (ya acordado).
- **Historial de servicio de la unidad:** además de `tickets`, exponer un
  resumen cronológico de visitas/diagnósticos por `sold_unit` para que el
  técnico vea el historial del equipo.

---

## Resumen de prioridades

| # | Bloque | Prioridad | Por qué |
|---|--------|-----------|---------|
| 0 | Exponer `client` + `rating_comment` en el detalle | 🔴 | El técnico no ve cliente/teléfono |
| 1 | Dirección + lat/lng + "cómo llegar" | 🔴 | Sin esto no hay visita a domicilio |
| 2 | `service_type` (remoto/domicilio/taller) | 🔴 | Define el flujo |
| 3 | Agenda / programación de visitas | 🟡 | Operación de campo |
| 4 | Check-in/out + reporte con firma | 🟡 | Constancia de servicio |
| 5 | Repuestos vinculados a stock | 🟡 | Trazabilidad e inventario |
| 6 | Presupuesto / aprobación | 🟡 | Servicios fuera de garantía |
| 7 | Validaciones de negocio | 🟡 | Quick wins de integridad |
| 8 | Perfil del técnico (zona/especialidad) | 🔵 | Asignación inteligente |
| 9 | SLA / push / historial | 🔵 | Mejora continua |
