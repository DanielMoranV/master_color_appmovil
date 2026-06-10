import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../network/mastercolor_api_provider.dart';
import 'auth_controller.dart';
import 'session.dart';

/// Usuario autenticado (datos mínimos para la UI), resuelto desde `/auth/me`
/// (staff) o `/client/auth/me` (cliente).
class AppUser {
  const AppUser({required this.id, required this.name});

  final int id;
  final String name;
}

/// Usuario de la sesión activa, o null si no se pudo resolver. Es best-effort:
/// si la llamada falla, devuelve null (la app sigue funcionando).
///
/// Habilita: mostrar el nombre en la UI y el "Asignarme a mí" del staff (que
/// necesita el `id` del técnico autenticado).
final currentUserProvider = FutureProvider<AppUser?>((ref) async {
  final role = ref.watch(currentRoleProvider);
  if (role == null) return null;
  final api = ref.watch(mastercolorApiProvider);
  try {
    if (role == UserRole.staff) {
      final res = await api.getSesinApi().authMeGet();
      final u = res.data?.data?.user;
      if (u?.id == null) return null;
      return AppUser(id: u!.id!, name: u.name ?? 'Técnico');
    } else {
      final res = await api.getSesinApi().clientAuthMeGet();
      final u = res.data?.data?.user;
      if (u?.id == null) return null;
      return AppUser(id: u!.id!, name: u.name ?? 'Cliente');
    }
  } catch (_) {
    return null;
  }
});
