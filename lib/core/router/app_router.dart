import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../auth/auth_controller.dart';
import '../../features/auth/login_screen.dart';
import '../../features/metrics/metrics_screen.dart';
import '../../features/tickets/create_ticket_screen.dart';
import '../../features/tickets/ticket_detail_screen.dart';
import '../../features/tickets/tickets_screen.dart';
import '../../features/units/register_unit_screen.dart';
import '../../features/units/unit_detail_screen.dart';
import '../../features/units/units_screen.dart';
import '../../features/staff_units/staff_units_screen.dart';
import '../../features/staff_units/staff_unit_detail_screen.dart';
import '../../shared/widgets/splash_screen.dart';

/// Router gateado por rol (go_router). Redirige según el [AuthState]:
///  - AuthUnknown        -> /splash (restaurando sesión)
///  - AuthUnauthenticated-> /login
///  - AuthAuthenticated  -> /client (cliente) o /staff (técnico)
final routerProvider = Provider<GoRouter>((ref) {
  // Puente entre Riverpod y go_router para `refreshListenable`.
  final refresh = ValueNotifier<AuthState>(const AuthUnknown());
  ref.listen<AuthState>(
    authControllerProvider,
    (_, next) => refresh.value = next,
    fireImmediately: true,
  );
  ref.onDispose(refresh.dispose);

  return GoRouter(
    initialLocation: '/splash',
    refreshListenable: refresh,
    redirect: (context, state) {
      final auth = refresh.value;
      final loc = state.matchedLocation;

      if (auth is AuthUnknown) {
        return loc == '/splash' ? null : '/splash';
      }
      if (auth is AuthUnauthenticated) {
        return loc == '/login' ? null : '/login';
      }
      if (auth is AuthAuthenticated) {
        final home = auth.session.isClient ? '/client' : '/staff';
        // Si está en splash/login o en el área del rol equivocado, redirige.
        final inWrongArea = auth.session.isClient
            ? loc.startsWith('/staff')
            : loc.startsWith('/client');
        if (loc == '/splash' || loc == '/login' || inWrongArea) {
          return home;
        }
      }
      return null;
    },
    routes: [
      GoRoute(path: '/splash', builder: (_, _) => const SplashScreen()),
      GoRoute(path: '/login', builder: (_, _) => const LoginScreen()),
      // Área cliente
      GoRoute(path: '/client', builder: (_, _) => const UnitsScreen()),
      GoRoute(
        path: '/client/units/new',
        builder: (_, _) => const RegisterUnitScreen(),
      ),
      GoRoute(
        path: '/client/units/:id',
        builder: (_, state) => UnitDetailScreen(
          unitId: int.parse(state.pathParameters['id']!),
        ),
      ),
      GoRoute(path: '/client/tickets', builder: (_, _) => const TicketsScreen()),
      GoRoute(
        path: '/client/tickets/new',
        builder: (_, state) => CreateTicketScreen(
          soldUnitId: int.tryParse(state.uri.queryParameters['unitId'] ?? ''),
        ),
      ),
      GoRoute(
        path: '/client/tickets/:id',
        builder: (_, state) => TicketDetailScreen(
          ticketId: int.parse(state.pathParameters['id']!),
        ),
      ),
      // Área técnico/staff
      GoRoute(path: '/staff', builder: (_, _) => const MetricsScreen()),
      GoRoute(path: '/staff/tickets', builder: (_, _) => const TicketsScreen()),
      GoRoute(
        path: '/staff/tickets/:id',
        builder: (_, state) => TicketDetailScreen(
          ticketId: int.parse(state.pathParameters['id']!),
        ),
      ),
      GoRoute(path: '/staff/units', builder: (_, _) => const StaffUnitsScreen()),
      GoRoute(
        path: '/staff/units/:id',
        builder: (_, state) => StaffUnitDetailScreen(
          unitId: int.parse(state.pathParameters['id']!),
        ),
      ),
    ],
  );
});
