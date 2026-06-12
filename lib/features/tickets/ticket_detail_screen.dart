import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mastercolor_api/mastercolor_api.dart';

import '../../core/auth/auth_controller.dart';
import '../../core/auth/session.dart';
import '../../core/launchers.dart';
import '../../core/network/api_exception.dart';
import 'package:image_picker/image_picker.dart';

import '../units/unit_presentation.dart' show StatusChip;
import '../visits/service_report_screen.dart';
import 'client_ticket_actions.dart';
import 'parts_actions.dart';
import 'staff_ticket_actions.dart';
import 'ticket_attachments.dart';
import 'ticket_presentation.dart';
import 'tickets_controller.dart';
import 'tickets_repository.dart';

/// Detalle de un ticket: cabecera, descripción, conversación y composer.
/// Staff puede cambiar el estado y enviar notas internas.
class TicketDetailScreen extends ConsumerStatefulWidget {
  const TicketDetailScreen({super.key, required this.ticketId});

  final int ticketId;

  @override
  ConsumerState<TicketDetailScreen> createState() => _TicketDetailScreenState();
}

class _TicketDetailScreenState extends ConsumerState<TicketDetailScreen> {
  final _composer = TextEditingController();
  bool _internalNote = false;
  bool _sending = false;
  bool _uploading = false;

  int get _id => widget.ticketId;

  @override
  void dispose() {
    _composer.dispose();
    super.dispose();
  }

  UserRole get _role => ref.read(currentRoleProvider) ?? UserRole.client;

  Future<void> _send() async {
    final body = _composer.text.trim();
    if (body.isEmpty || _sending) return;
    setState(() => _sending = true);
    try {
      await ref.read(ticketsRepositoryProvider).sendMessage(
            role: _role,
            id: _id,
            body: body,
            isInternal: _internalNote,
          );
      _composer.clear();
      _internalNote = false;
      ref.invalidate(ticketDetailProvider(_id));
      ref.read(ticketsControllerProvider.notifier).refresh();
    } catch (e) {
      if (mounted) _showError(e, fallback: 'No se pudo enviar el mensaje.');
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  Future<void> _pickAndUpload() async {
    if (_uploading) return;
    final picked = await ImagePicker().pickMultiImage();
    if (picked.isEmpty) return;
    setState(() => _uploading = true);
    try {
      await ref
          .read(ticketsRepositoryProvider)
          .addAttachments(role: _role, id: _id, files: picked);
      ref.invalidate(ticketDetailProvider(_id));
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${picked.length} adjunto(s) enviado(s).')),
        );
      }
    } catch (e) {
      if (mounted) _showError(e, fallback: 'No se pudieron enviar los adjuntos.');
    } finally {
      if (mounted) setState(() => _uploading = false);
    }
  }

  Future<void> _changeStatus(TicketStatus status) async {
    try {
      await ref
          .read(ticketsRepositoryProvider)
          .changeStatus(id: _id, status: status);
      ref.invalidate(ticketDetailProvider(_id));
      ref.read(ticketsControllerProvider.notifier).refresh();
    } catch (e) {
      if (mounted) _showError(e, fallback: 'No se pudo cambiar el estado.');
    }
  }

  Future<void> _assign() async {
    final ok = await showAssignDialog(context, ticketId: _id);
    if (ok) {
      ref.invalidate(ticketDetailProvider(_id));
      ref.read(ticketsControllerProvider.notifier).refresh();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ticket asignado.')),
        );
      }
    }
  }

  Future<void> _diagnose() async {
    final ok = await showDiagnosisDialog(context, ticketId: _id);
    if (ok) {
      ref.invalidate(ticketDetailProvider(_id));
      ref.read(ticketsControllerProvider.notifier).refresh();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Diagnóstico registrado.')),
        );
      }
    }
  }

  Future<void> _createQuote() async {
    final ok = await showQuoteDialog(context, ticketId: _id);
    if (ok) {
      ref.invalidate(ticketDetailProvider(_id));
      ref.read(ticketsControllerProvider.notifier).refresh();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cotización enviada al cliente.')),
        );
      }
    }
  }

  Future<void> _decideQuote({required bool approve}) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(approve ? 'Aprobar cotización' : 'Rechazar cotización'),
        content: Text(approve
            ? '¿Aprobar el presupuesto para continuar con el servicio?'
            : '¿Rechazar el presupuesto?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(approve ? 'Aprobar' : 'Rechazar'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    try {
      final repo = ref.read(ticketsRepositoryProvider);
      approve ? await repo.approveQuote(_id) : await repo.rejectQuote(_id);
      ref.invalidate(ticketDetailProvider(_id));
      ref.read(ticketsControllerProvider.notifier).refresh();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                approve ? 'Cotización aprobada.' : 'Cotización rechazada.'),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        _showError(e, fallback: 'No se pudo procesar la cotización.');
      }
    }
  }

  Future<void> _addPart() async {
    final ok = await showAddPartDialog(context, ticketId: _id);
    if (ok) {
      ref.invalidate(ticketDetailProvider(_id));
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Repuesto agregado.')),
        );
      }
    }
  }

  Future<void> _removePart(int partId) async {
    try {
      await ref.read(ticketsRepositoryProvider).removePart(id: _id, partId: partId);
      ref.invalidate(ticketDetailProvider(_id));
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Repuesto quitado.')),
        );
      }
    } catch (e) {
      if (mounted) _showError(e, fallback: 'No se pudo quitar el repuesto.');
    }
  }

  Future<void> _checkIn() async {
    try {
      await ref.read(ticketsRepositoryProvider).checkIn(id: _id);
      ref.invalidate(ticketDetailProvider(_id));
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Llegada registrada (check-in).')),
        );
      }
    } catch (e) {
      if (mounted) _showError(e, fallback: 'No se pudo registrar el check-in.');
    }
  }

  Future<void> _checkOut() async {
    try {
      await ref.read(ticketsRepositoryProvider).checkOut(id: _id);
      ref.invalidate(ticketDetailProvider(_id));
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Salida registrada (check-out).')),
        );
      }
    } catch (e) {
      if (mounted) _showError(e, fallback: 'No se pudo registrar el check-out.');
    }
  }

  Future<void> _openServiceReport() async {
    final ok = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (_) => ServiceReportScreen(ticketId: _id),
      ),
    );
    if (ok == true) {
      ref.invalidate(ticketDetailProvider(_id));
      ref.read(ticketsControllerProvider.notifier).refresh();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Acta registrada.')),
        );
      }
    }
  }

  Future<void> _schedule(SupportTicketDetail ticket) async {
    final ok = await showScheduleDialog(
      context,
      ticketId: _id,
      current: ticket.scheduledAt,
      currentWindowMinutes: ticket.scheduledWindowMinutes,
    );
    if (ok) {
      ref.invalidate(ticketDetailProvider(_id));
      ref.read(ticketsControllerProvider.notifier).refresh();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Visita programada.')),
        );
      }
    }
  }

  Future<void> _rate() async {
    final ok = await showRateDialog(context, ticketId: _id);
    if (ok) {
      ref.invalidate(ticketDetailProvider(_id));
      ref.read(ticketsControllerProvider.notifier).refresh();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('¡Gracias por tu calificación!')),
        );
      }
    }
  }

  Future<void> _reopen() async {
    final ok = await showReopenDialog(context, ticketId: _id);
    if (ok) {
      ref.invalidate(ticketDetailProvider(_id));
      ref.read(ticketsControllerProvider.notifier).refresh();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ticket reabierto.')),
        );
      }
    }
  }

  /// Muestra un error amigable: el `displayMessage` de [ApiException] (sin el
  /// código técnico), o un mensaje genérico para cualquier otro error.
  void _showError(Object error, {String fallback = 'Ocurrió un error.'}) {
    final message = error is ApiException ? error.displayMessage : fallback;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final detailAsync = ref.watch(ticketDetailProvider(_id));
    final isStaff = _role == UserRole.staff;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ticket'),
        actions: [
          if (isStaff) ...[
            // Asignar / diagnosticar / programar solo tienen sentido mientras el
            // ticket no es terminal; el backend rechazaría (409) si no.
            detailAsync.maybeWhen(
              data: (t) {
                if (t.status?.isClosed ?? false) return const SizedBox.shrink();
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.person_add_alt),
                      tooltip: 'Asignar técnico',
                      onPressed: _assign,
                    ),
                    IconButton(
                      icon: const Icon(Icons.medical_services_outlined),
                      tooltip: 'Diagnóstico',
                      onPressed: _diagnose,
                    ),
                    IconButton(
                      icon: const Icon(Icons.event_outlined),
                      tooltip: 'Programar visita',
                      onPressed: () => _schedule(t),
                    ),
                  ],
                );
              },
              orElse: () => const SizedBox.shrink(),
            ),
            detailAsync.maybeWhen(
              data: (t) {
                // Solo se ofrecen las transiciones válidas desde el estado
                // actual (evita que el backend rechace cambios imposibles).
                final next = t.status?.nextStatuses ?? const [];
                if (next.isEmpty) return const SizedBox.shrink();
                return PopupMenuButton<TicketStatus>(
                  icon: const Icon(Icons.swap_horiz),
                  tooltip: 'Cambiar estado',
                  onSelected: _changeStatus,
                  itemBuilder: (_) => [
                    for (final s in next)
                      PopupMenuItem(value: s, child: Text(s.label)),
                  ],
                );
              },
              orElse: () => const SizedBox.shrink(),
            ),
          ],
          if (!isStaff)
            detailAsync.maybeWhen(
              data: (t) {
                final status = t.status;
                final canRate =
                    status == TicketStatus.resuelto && t.rating == null;
                final canReopen = status == TicketStatus.resuelto ||
                    status == TicketStatus.cerrado;
                if (!canRate && !canReopen) return const SizedBox.shrink();
                return PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert),
                  tooltip: 'Acciones',
                  onSelected: (v) => v == 'rate' ? _rate() : _reopen(),
                  itemBuilder: (_) => [
                    if (canRate)
                      const PopupMenuItem(
                        value: 'rate',
                        child: ListTile(
                          leading: Icon(Icons.star_outline),
                          title: Text('Calificar atención'),
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    if (canReopen)
                      const PopupMenuItem(
                        value: 'reopen',
                        child: ListTile(
                          leading: Icon(Icons.replay),
                          title: Text('Reabrir ticket'),
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                  ],
                );
              },
              orElse: () => const SizedBox.shrink(),
            ),
        ],
      ),
      body: detailAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  err is ApiException
                      ? err.displayMessage
                      : 'No se pudo cargar el ticket.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                FilledButton.tonal(
                  onPressed: () => ref.invalidate(ticketDetailProvider(_id)),
                  child: const Text('Reintentar'),
                ),
              ],
            ),
          ),
        ),
        data: (ticket) {
          final closed = ticket.status?.isClosed ?? false;
          return Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async =>
                      ref.invalidate(ticketDetailProvider(_id)),
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      _Header(ticket: ticket),
                      const SizedBox(height: 16),
                      _ServiceCard(ticket: ticket),
                      if (isStaff && ticket.client != null) ...[
                        const SizedBox(height: 16),
                        _ClientContactCard(client: ticket.client!),
                      ],
                      if (isStaff) ...[
                        const SizedBox(height: 16),
                        _VisitsSection(
                          visits: ticket.visits ?? const [],
                          ticketClosed: closed,
                          onCheckIn: _checkIn,
                          onCheckOut: _checkOut,
                          onServiceReport: _openServiceReport,
                        ),
                        const SizedBox(height: 16),
                        _PartsSection(
                          parts: ticket.parts ?? const [],
                          ticketClosed: closed,
                          onAdd: _addPart,
                          onRemove: _removePart,
                        ),
                      ],
                      if (ticket.quote != null || (isStaff && !closed)) ...[
                        const SizedBox(height: 16),
                        _QuoteCard(
                          quote: ticket.quote,
                          isStaff: isStaff,
                          ticketClosed: closed,
                          onCreate: _createQuote,
                          onApprove: () => _decideQuote(approve: true),
                          onReject: () => _decideQuote(approve: false),
                        ),
                      ],
                      if (ticket.diagnosis != null &&
                          ticket.diagnosis!.isNotEmpty) ...[
                        const SizedBox(height: 16),
                        _DiagnosisCard(
                          diagnosis: ticket.diagnosis!,
                          partsUsed: ticket.partsUsed,
                        ),
                      ],
                      if (ticket.statusHistory != null &&
                          ticket.statusHistory!.isNotEmpty) ...[
                        const SizedBox(height: 16),
                        _StatusHistorySection(history: ticket.statusHistory!),
                      ],
                      const SizedBox(height: 16),
                      Text('Conversación',
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 8),
                      ..._buildConversation(ticket),
                    ],
                  ),
                ),
              ),
              if (closed)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  child: Text(
                    'Este ticket está ${ticket.status!.label.toLowerCase()}.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                )
              else
                _Composer(
                  controller: _composer,
                  sending: _sending,
                  showInternalToggle: isStaff,
                  internalNote: _internalNote,
                  onInternalChanged: (v) => setState(() => _internalNote = v),
                  onSend: _send,
                  showAttach: true,
                  uploading: _uploading,
                  onAttach: _pickAndUpload,
                ),
            ],
          );
        },
      ),
    );
  }

  List<Widget> _buildConversation(SupportTicketDetail ticket) {
    final messages = ticket.messages ?? const [];
    if (messages.isEmpty) {
      return [
        // El cuerpo original del ticket como primer "mensaje" del cliente.
        if (ticket.description != null)
          _MessageBubble(
            body: ticket.description!,
            authorName: 'Descripción inicial',
            fromClient: true,
            isInternal: false,
            createdAt: ticket.createdAt,
            attachments: ticket.attachments ?? const [],
          ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Center(child: Text('Aún no hay respuestas.')),
        ),
      ];
    }
    return [
      for (final m in messages)
        _MessageBubble(
          body: m.body ?? '',
          authorName: m.authorName ?? '—',
          fromClient: m.authorType == AuthorType.client,
          isInternal: m.isInternal ?? false,
          createdAt: m.createdAt,
          attachments: m.attachments ?? const [],
        ),
    ];
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.ticket});

  final SupportTicketDetail ticket;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (ticket.code != null)
                  Text(ticket.code!,
                      style: const TextStyle(
                          fontFamily: 'monospace', color: Colors.grey)),
                const Spacer(),
                if (ticket.status != null)
                  StatusChip(
                      label: ticket.status!.label, color: ticket.status!.color),
              ],
            ),
            const SizedBox(height: 8),
            Text(ticket.subject ?? 'Ticket #${ticket.id ?? '—'}',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: [
                if (ticket.priority != null)
                  StatusChip(
                    label: 'Prioridad ${ticket.priority!.label}',
                    color: ticket.priority!.color,
                    icon: Icons.flag_outlined,
                  ),
                if (ticket.category != null)
                  StatusChip(
                      label: ticket.category!.label, color: Colors.blueGrey),
                if (ticket.isWarrantyCovered == true)
                  const StatusChip(
                    label: 'En garantía',
                    color: Colors.green,
                    icon: Icons.verified_outlined,
                  ),
                if (slaPresentation(ticket.slaStatus?.value) case final sla?)
                  StatusChip(label: sla.label, color: sla.color, icon: sla.icon),
              ],
            ),
            if (ticket.assignedUserName != null) ...[
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(Icons.engineering, size: 16, color: Colors.grey),
                  const SizedBox(width: 6),
                  Text('Asignado a ${ticket.assignedUserName}'),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Tipo de servicio y, si es a domicilio, la dirección con botón "Cómo llegar".
class _ServiceCard extends StatelessWidget {
  const _ServiceCard({required this.ticket});

  final SupportTicketDetail ticket;

  static final _scheduleFormat = DateFormat('EEE d MMM · HH:mm', 'es');

  @override
  Widget build(BuildContext context) {
    final type = ticket.serviceType;
    final address = ticket.serviceAddress;
    final isHome =
        type == SupportTicketDetailServiceTypeEnum.domicilio && address != null;
    final scheduled = ticket.scheduledAt?.toLocal();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(type?.icon ?? Icons.build_outlined, size: 18),
                const SizedBox(width: 8),
                Text('Servicio ${type?.label.toLowerCase() ?? '—'}',
                    style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            if (scheduled != null) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.event_outlined,
                      size: 16, color: Colors.grey),
                  const SizedBox(width: 6),
                  Text(
                    'Visita: ${_scheduleFormat.format(scheduled)}'
                    '${ticket.scheduledWindowMinutes != null ? ' (${ticket.scheduledWindowMinutes}min)' : ''}',
                  ),
                ],
              ),
            ],
            if (isHome) ...[
              const SizedBox(height: 12),
              Text(address.addressFull ?? '—'),
              if ([address.district, address.province, address.department]
                  .any((e) => e != null && e.isNotEmpty))
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    [address.district, address.province, address.department]
                        .where((e) => e != null && e.isNotEmpty)
                        .join(', '),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              if (address.reference != null && address.reference!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text('Ref.: ${address.reference}',
                      style: const TextStyle(fontStyle: FontStyle.italic)),
                ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: FilledButton.tonalIcon(
                  icon: const Icon(Icons.directions),
                  label: const Text('Cómo llegar'),
                  onPressed: () async {
                    final ok = await openDirections(
                      latitude: address.latitude,
                      longitude: address.longitude,
                      fallbackQuery: address.addressFull,
                    );
                    if (!ok && context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('No se pudo abrir el mapa.'),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Datos de contacto del cliente (solo staff): correo y teléfono accionables.
class _ClientContactCard extends StatelessWidget {
  const _ClientContactCard({required this.client});

  final SupportTicketClient client;

  @override
  Widget build(BuildContext context) {
    final phone = client.phone;
    final email = client.email;
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.person_outline, size: 18),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(client.name ?? 'Cliente',
                      style: Theme.of(context).textTheme.titleMedium),
                ),
              ],
            ),
            if (phone != null && phone.isNotEmpty)
              ListTile(
                contentPadding: EdgeInsets.zero,
                dense: true,
                leading: const Icon(Icons.phone_outlined),
                title: Text(phone),
                trailing: const Icon(Icons.call, size: 18),
                onTap: () => openPhone(phone),
              ),
            if (email != null && email.isNotEmpty)
              ListTile(
                contentPadding: EdgeInsets.zero,
                dense: true,
                leading: const Icon(Icons.email_outlined),
                title: Text(email),
                trailing: const Icon(Icons.send, size: 18),
                onTap: () => openEmail(email),
              ),
          ],
        ),
      ),
    );
  }
}

/// Visitas en sitio (staff): acciones de check-in/out + acta y el historial de
/// visitas con su acta PDF.
class _VisitsSection extends StatelessWidget {
  const _VisitsSection({
    required this.visits,
    required this.ticketClosed,
    required this.onCheckIn,
    required this.onCheckOut,
    required this.onServiceReport,
  });

  final List<TicketVisit> visits;
  final bool ticketClosed;
  final VoidCallback onCheckIn;
  final VoidCallback onCheckOut;
  final VoidCallback onServiceReport;

  static final _dateFormat = DateFormat('dd MMM · HH:mm', 'es');

  @override
  Widget build(BuildContext context) {
    // Visita abierta = con check-in pero sin check-out.
    TicketVisit? open;
    for (final v in visits) {
      if (v.checkinAt != null && v.checkoutAt == null) {
        open = v;
        break;
      }
    }
    final completed =
        visits.where((v) => v.checkoutAt != null).toList(growable: false);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.assignment_outlined, size: 18),
                const SizedBox(width: 8),
                Text('Visitas en sitio',
                    style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            const SizedBox(height: 12),
            if (open != null) ...[
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.green, size: 18),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        open.checkinAt != null
                            ? 'En sitio desde ${_dateFormat.format(open.checkinAt!.toLocal())}'
                            : 'Visita en curso',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.description_outlined, size: 18),
                      label: const Text('Acta'),
                      onPressed: onServiceReport,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: FilledButton.icon(
                      icon: const Icon(Icons.logout, size: 18),
                      label: const Text('Check-out'),
                      onPressed: onCheckOut,
                    ),
                  ),
                ],
              ),
            ] else if (!ticketClosed)
              FilledButton.tonalIcon(
                icon: const Icon(Icons.login),
                label: const Text('Registrar llegada (check-in)'),
                onPressed: onCheckIn,
              ),
            if (completed.isNotEmpty) ...[
              const SizedBox(height: 8),
              const Divider(),
              for (final v in completed) _VisitTile(visit: v),
            ],
          ],
        ),
      ),
    );
  }
}

class _VisitTile extends StatelessWidget {
  const _VisitTile({required this.visit});

  final TicketVisit visit;

  static final _dateFormat = DateFormat('dd MMM yyyy · HH:mm', 'es');

  @override
  Widget build(BuildContext context) {
    final checkin = visit.checkinAt?.toLocal();
    final checkout = visit.checkoutAt?.toLocal();
    final pdfUrl = visit.reportPdfUrl;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.check_circle_outline,
                  size: 16, color: Colors.green),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  [
                    if (checkin != null) _dateFormat.format(checkin),
                    if (checkout != null) '→ ${DateFormat('HH:mm').format(checkout)}',
                    if (visit.durationMinutes != null)
                      '(${visit.durationMinutes}min)',
                  ].join(' '),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
          if (visit.technicianName != null)
            Padding(
              padding: const EdgeInsets.only(left: 22, top: 2),
              child: Text('Técnico: ${visit.technicianName}',
                  style: Theme.of(context).textTheme.bodySmall),
            ),
          if (visit.workDone != null && visit.workDone!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 22, top: 4),
              child: Text(visit.workDone!),
            ),
          Padding(
            padding: const EdgeInsets.only(left: 14, top: 4),
            child: Row(
              children: [
                if (visit.signatureUrl != null)
                  const Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Icon(Icons.draw_outlined,
                        size: 16, color: Colors.grey),
                  ),
                if (pdfUrl != null && pdfUrl.isNotEmpty)
                  TextButton.icon(
                    icon: const Icon(Icons.picture_as_pdf_outlined, size: 18),
                    label: const Text('Ver acta (PDF)'),
                    onPressed: () async {
                      final ok = await openWebUrl(pdfUrl);
                      if (!ok && context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('No se pudo abrir el acta.'),
                          ),
                        );
                      }
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Cotización del ticket: importes y estado. Staff puede crearla; el cliente
/// puede aprobar/rechazar mientras esté pendiente.
class _QuoteCard extends StatelessWidget {
  const _QuoteCard({
    required this.quote,
    required this.isStaff,
    required this.ticketClosed,
    required this.onCreate,
    required this.onApprove,
    required this.onReject,
  });

  final TicketQuote? quote;
  final bool isStaff;
  final bool ticketClosed;
  final VoidCallback onCreate;
  final VoidCallback onApprove;
  final VoidCallback onReject;

  String _money(double? v, String? currency) {
    final symbol = currency == 'USD' ? '\$' : 'S/';
    return '$symbol ${(v ?? 0).toStringAsFixed(2)}';
  }

  @override
  Widget build(BuildContext context) {
    final q = quote;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.request_quote_outlined, size: 18),
                const SizedBox(width: 8),
                Text('Cotización',
                    style: Theme.of(context).textTheme.titleMedium),
                const Spacer(),
                if (q?.status != null)
                  StatusChip(label: q!.status!.label, color: q.status!.color),
              ],
            ),
            if (q == null) ...[
              const SizedBox(height: 8),
              Text('Sin cotización registrada.',
                  style: Theme.of(context).textTheme.bodySmall),
              if (isStaff && !ticketClosed) ...[
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: FilledButton.tonalIcon(
                    icon: const Icon(Icons.add),
                    label: const Text('Crear cotización'),
                    onPressed: onCreate,
                  ),
                ),
              ],
            ] else ...[
              const SizedBox(height: 12),
              _row(context, 'Mano de obra', _money(q.laborCost, q.currency)),
              _row(context, 'Repuestos', _money(q.partsCost, q.currency)),
              const Divider(),
              _row(context, 'Total', _money(q.total, q.currency), bold: true),
              if (q.note != null && q.note!.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text('"${q.note}"',
                    style: const TextStyle(fontStyle: FontStyle.italic)),
              ],
              if (!isStaff && q.status == TicketQuoteStatusEnum.pendiente) ...[
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: onReject,
                        child: const Text('Rechazar'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: FilledButton(
                        onPressed: onApprove,
                        child: const Text('Aprobar'),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }

  Widget _row(BuildContext context, String label, String value,
      {bool bold = false}) {
    final style = bold
        ? Theme.of(context).textTheme.titleMedium
        : Theme.of(context).textTheme.bodyMedium;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: style),
          Text(value, style: style),
        ],
      ),
    );
  }
}

/// Repuestos consumidos en el ticket (staff): lista con costo y opción de
/// quitar, más el botón para registrar consumo desde inventario.
class _PartsSection extends StatelessWidget {
  const _PartsSection({
    required this.parts,
    required this.ticketClosed,
    required this.onAdd,
    required this.onRemove,
  });

  final List<TicketPart> parts;
  final bool ticketClosed;
  final VoidCallback onAdd;
  final ValueChanged<int> onRemove;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.handyman_outlined, size: 18),
                const SizedBox(width: 8),
                Text('Repuestos',
                    style: Theme.of(context).textTheme.titleMedium),
                const Spacer(),
                if (!ticketClosed)
                  TextButton.icon(
                    icon: const Icon(Icons.add, size: 18),
                    label: const Text('Agregar'),
                    onPressed: onAdd,
                  ),
              ],
            ),
            if (parts.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text('Sin repuestos registrados.',
                    style: Theme.of(context).textTheme.bodySmall),
              )
            else
              for (final p in parts)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  title: Text(p.productName ?? 'Repuesto'),
                  subtitle: Text(
                    [
                      if (p.sku != null) p.sku!,
                      'x${p.quantity ?? 1}',
                      if (p.unitCost != null)
                        'S/ ${p.unitCost!.toStringAsFixed(2)}',
                    ].join(' · '),
                  ),
                  trailing: (ticketClosed || p.id == null)
                      ? null
                      : IconButton(
                          icon: const Icon(Icons.delete_outline),
                          tooltip: 'Quitar',
                          onPressed: () => onRemove(p.id!),
                        ),
                ),
          ],
        ),
      ),
    );
  }
}

class _DiagnosisCard extends StatelessWidget {
  const _DiagnosisCard({required this.diagnosis, this.partsUsed});

  final String diagnosis;
  final String? partsUsed;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.tertiaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.medical_services_outlined, size: 18),
                const SizedBox(width: 8),
                Text('Diagnóstico',
                    style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            const SizedBox(height: 8),
            Text(diagnosis),
            if (partsUsed != null && partsUsed!.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text('Repuestos: $partsUsed',
                  style: Theme.of(context).textTheme.bodySmall),
            ],
          ],
        ),
      ),
    );
  }
}

/// Historial de cambios de estado como timeline vertical (colapsable).
class _StatusHistorySection extends StatelessWidget {
  const _StatusHistorySection({required this.history});

  final List<TicketStatusHistory> history;

  static final _dateFormat = DateFormat('dd MMM yyyy · HH:mm', 'es');

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        leading: const Icon(Icons.history),
        title: Text('Historial de estados (${history.length})'),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        children: [
          for (var i = 0; i < history.length; i++)
            _TimelineEntry(
              entry: history[i],
              isFirst: i == 0,
              isLast: i == history.length - 1,
              dateFormat: _dateFormat,
            ),
        ],
      ),
    );
  }
}

class _TimelineEntry extends StatelessWidget {
  const _TimelineEntry({
    required this.entry,
    required this.isFirst,
    required this.isLast,
    required this.dateFormat,
  });

  final TicketStatusHistory entry;
  final bool isFirst;
  final bool isLast;
  final DateFormat dateFormat;

  @override
  Widget build(BuildContext context) {
    final color = entry.toStatus?.color ?? Colors.grey;
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Línea + punto del timeline.
          Column(
            children: [
              Container(
                width: 2,
                height: 6,
                color: isFirst ? Colors.transparent : Colors.grey.shade300,
              ),
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              Expanded(
                child: Container(
                  width: 2,
                  color: isLast ? Colors.transparent : Colors.grey.shade300,
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StatusChip(
                    label: entry.toStatus?.label ?? entry.toStatus?.value ?? '—',
                    color: color,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    [
                      if (entry.changedByName != null)
                        'por ${entry.changedByName}',
                      if (entry.createdAt != null)
                        dateFormat.format(entry.createdAt!.toLocal()),
                    ].join(' · '),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  if (entry.note != null && entry.note!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text('"${entry.note}"',
                          style: const TextStyle(fontStyle: FontStyle.italic)),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  const _MessageBubble({
    required this.body,
    required this.authorName,
    required this.fromClient,
    required this.isInternal,
    required this.createdAt,
    this.attachments = const [],
  });

  final String body;
  final String authorName;
  final bool fromClient;
  final bool isInternal;
  final DateTime? createdAt;
  final List<TicketAttachment> attachments;

  static final _dateFormat = DateFormat('dd MMM · HH:mm', 'es');

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final Color bg;
    if (isInternal) {
      bg = Colors.amber.withValues(alpha: 0.2);
    } else if (fromClient) {
      bg = scheme.surfaceContainerHighest;
    } else {
      bg = scheme.primaryContainer;
    }
    return Align(
      alignment: fromClient ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.78,
        ),
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(12),
          border: isInternal
              ? Border.all(color: Colors.amber, width: 1)
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    authorName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ),
                if (isInternal) ...[
                  const SizedBox(width: 6),
                  const Icon(Icons.lock_outline, size: 12, color: Colors.brown),
                  const Text(' nota interna',
                      style: TextStyle(fontSize: 11, color: Colors.brown)),
                ],
              ],
            ),
            const SizedBox(height: 4),
            if (body.isNotEmpty) Text(body),
            if (attachments.isNotEmpty)
              AttachmentGallery(attachments: attachments),
            if (createdAt != null) ...[
              const SizedBox(height: 4),
              Text(
                _dateFormat.format(createdAt!.toLocal()),
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _Composer extends StatelessWidget {
  const _Composer({
    required this.controller,
    required this.sending,
    required this.showInternalToggle,
    required this.internalNote,
    required this.onInternalChanged,
    required this.onSend,
    required this.showAttach,
    required this.uploading,
    required this.onAttach,
  });

  final TextEditingController controller;
  final bool sending;
  final bool showInternalToggle;
  final bool internalNote;
  final ValueChanged<bool> onInternalChanged;
  final VoidCallback onSend;
  final bool showAttach;
  final bool uploading;
  final VoidCallback onAttach;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border(
            top: BorderSide(color: Theme.of(context).dividerColor),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showInternalToggle)
              Row(
                children: [
                  Switch(value: internalNote, onChanged: onInternalChanged),
                  const Text('Nota interna (no visible al cliente)'),
                ],
              ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (showAttach)
                  IconButton(
                    onPressed: uploading ? null : onAttach,
                    tooltip: 'Adjuntar imágenes',
                    icon: uploading
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.attach_file),
                  ),
                Expanded(
                  child: TextField(
                    controller: controller,
                    minLines: 1,
                    maxLines: 4,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      hintText: internalNote
                          ? 'Escribe una nota interna…'
                          : 'Escribe un mensaje…',
                      border: const OutlineInputBorder(),
                      isDense: true,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton.filled(
                  onPressed: sending ? null : onSend,
                  icon: sending
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.send),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
