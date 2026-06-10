import 'package:flutter/material.dart';

/// Identidad visual de MasterColor (Master Color Import E.I.R.L.).
///
/// Colores tomados del logo: azul navy como primario, con dorado y rojo de
/// acento (secundario/terciario).
class Brand {
  const Brand._();

  static const Color navy = Color(0xFF1A4F8B); // primario
  static const Color gold = Color(0xFFF0A830); // secundario
  static const Color red = Color(0xFFC8102E); // terciario
  static const Color blueBright = Color(0xFF0090D8); // acento claro
}

/// Tema Material 3 de la app, anclado a los colores de marca.
class AppTheme {
  const AppTheme._();

  static ThemeData get light {
    final scheme = ColorScheme.fromSeed(
      seedColor: Brand.navy,
      primary: Brand.navy,
      secondary: Brand.gold,
      tertiary: Brand.red,
    );
    return _build(scheme);
  }

  static ThemeData _build(ColorScheme scheme) {
    return ThemeData(
      colorScheme: scheme,
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        elevation: 0,
        centerTitle: false,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
      ),
    );
  }
}
