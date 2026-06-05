import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:master_color_app/app.dart';

void main() {
  testWidgets('Arranca en splash mientras restaura sesión',
      (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: MasterColorApp()));

    // Sin sesión persistida, el primer frame muestra el splash.
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
