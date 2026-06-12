import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastercolor_api/mastercolor_api.dart';

import '../../core/auth/current_user.dart';
import '../../core/network/api_exception.dart';
import '../tickets/tickets_repository.dart';

/// Perfil del técnico autenticado, hallado en `GET /support/technicians` por su
/// id de usuario. `null` si no se encuentra (p. ej. el usuario no es técnico).
final myTechnicianProvider = FutureProvider.autoDispose<Technician?>((ref) async {
  final user = await ref.watch(currentUserProvider.future);
  if (user == null) return null;
  final techs = await ref.watch(ticketsRepositoryProvider).listTechnicians();
  for (final t in techs) {
    if (t.id == user.id) return t;
  }
  return null;
});

String _specialtyLabel(TechnicianProfileRequestSpecialtiesEnum s) =>
    switch (s) {
      TechnicianProfileRequestSpecialtiesEnum.garantia => 'Garantía',
      TechnicianProfileRequestSpecialtiesEnum.instalacion => 'Instalación',
      TechnicianProfileRequestSpecialtiesEnum.falla => 'Falla',
      TechnicianProfileRequestSpecialtiesEnum.consulta => 'Consulta',
      TechnicianProfileRequestSpecialtiesEnum.otro => 'Otro',
    };

/// Pantalla para que el técnico edite su disponibilidad, especialidades y zonas
/// de cobertura (`PATCH /support/technicians/me`).
class TechnicianProfileScreen extends ConsumerStatefulWidget {
  const TechnicianProfileScreen({super.key});

  @override
  ConsumerState<TechnicianProfileScreen> createState() =>
      _TechnicianProfileScreenState();
}

class _TechnicianProfileScreenState
    extends ConsumerState<TechnicianProfileScreen> {
  final _specialties = <TechnicianProfileRequestSpecialtiesEnum>{};
  final _zones = <String>[];
  final _zoneInput = TextEditingController();
  bool _available = true;
  bool _loadedFrom = false;
  bool _saving = false;

  @override
  void dispose() {
    _zoneInput.dispose();
    super.dispose();
  }

  /// Precarga el formulario con los datos del técnico la primera vez que llegan.
  void _prefill(Technician tech) {
    if (_loadedFrom) return;
    _loadedFrom = true;
    _available = tech.isAvailable ?? true;
    _zones.addAll(tech.coverageZones ?? const []);
    for (final s in tech.specialties ?? const <TechnicianSpecialtiesEnum>[]) {
      final match = TechnicianProfileRequestSpecialtiesEnum.values
          .where((e) => e.value == s.value);
      if (match.isNotEmpty) _specialties.add(match.first);
    }
  }

  void _addZone() {
    final zone = _zoneInput.text.trim();
    if (zone.isEmpty || _zones.contains(zone)) return;
    setState(() {
      _zones.add(zone);
      _zoneInput.clear();
    });
  }

  Future<void> _save() async {
    setState(() => _saving = true);
    try {
      await ref.read(ticketsRepositoryProvider).updateMyProfile(
            specialties: _specialties.toList(),
            coverageZones: _zones,
            isAvailable: _available,
          );
      ref.invalidate(myTechnicianProvider);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Perfil actualizado.')),
        );
        Navigator.of(context).pop();
      }
    } on ApiException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.displayMessage)));
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No se pudo actualizar el perfil.')),
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileAsync = ref.watch(myTechnicianProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Mi perfil')),
      body: profileAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              err is ApiException
                  ? err.displayMessage
                  : 'No se pudo cargar el perfil.',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        data: (tech) {
          if (tech == null) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Text(
                  'No se encontró tu perfil de técnico.',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          _prefill(tech);
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              if (tech.name != null)
                Text(tech.name!,
                    style: Theme.of(context).textTheme.headlineSmall),
              if (tech.email != null)
                Text(tech.email!,
                    style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: 16),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                value: _available,
                onChanged: (v) => setState(() => _available = v),
                title: const Text('Disponible para asignaciones'),
              ),
              const Divider(),
              const SizedBox(height: 8),
              Text('Especialidades',
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: [
                  for (final s
                      in TechnicianProfileRequestSpecialtiesEnum.values)
                    FilterChip(
                      label: Text(_specialtyLabel(s)),
                      selected: _specialties.contains(s),
                      onSelected: (sel) => setState(() {
                        sel ? _specialties.add(s) : _specialties.remove(s);
                      }),
                    ),
                ],
              ),
              const SizedBox(height: 16),
              Text('Zonas de cobertura',
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              if (_zones.isNotEmpty)
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    for (final z in _zones)
                      Chip(
                        label: Text(z),
                        onDeleted: () => setState(() => _zones.remove(z)),
                      ),
                  ],
                ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _zoneInput,
                      textCapitalization: TextCapitalization.words,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (_) => _addZone(),
                      decoration: const InputDecoration(
                        labelText: 'Agregar zona (distrito)',
                        border: OutlineInputBorder(),
                        isDense: true,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton.filledTonal(
                    icon: const Icon(Icons.add),
                    onPressed: _addZone,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: _saving ? null : _save,
                child: _saving
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Guardar perfil'),
              ),
            ],
          );
        },
      ),
    );
  }
}
