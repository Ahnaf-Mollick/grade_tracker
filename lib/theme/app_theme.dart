// lib/theme/app_theme.dart

import 'package:flutter/material.dart';

class AppTheme {
  // ── Light palette ─────────────────────────────────────────────────────────
  static const _lightBackground = Color(0xFFF7F5F0);
  static const _lightSurface = Color(0xFFFFFFFF);
  static const _lightPrimary = Color(0xFF1A1A2E); // deep navy
  static const _lightAccent = Color(0xFFD4A857); // warm gold
  static const _lightOnPrimary = Color(0xFFFFFFFF);
  static const _lightOnSurface = Color(0xFF1A1A2E);
  static const _lightSubtle = Color(0xFF8A8A9A);
  static const _lightError = Color(0xFFC0392B);

  // ── Dark palette ──────────────────────────────────────────────────────────
  static const _darkBackground = Color(0xFF0F0F1A);
  static const _darkSurface = Color(0xFF1C1C2E);
  static const _darkPrimary = Color(0xFFD4A857); // gold becomes primary
  static const _darkAccent = Color(0xFFD4A857);
  static const _darkOnPrimary = Color(0xFF0F0F1A);
  static const _darkOnSurface = Color(0xFFEAE8E0);
  static const _darkSubtle = Color(0xFF6A6A7A);
  static const _darkError = Color(0xFFE74C3C);

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: _lightBackground,
      primaryColor: _lightPrimary,
      colorScheme: const ColorScheme.light(
        primary: _lightPrimary,
        secondary: _lightAccent,
        surface: _lightSurface,
        error: _lightError,
        onPrimary: _lightOnPrimary,
        onSurface: _lightOnSurface,
        onError: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: _lightPrimary,
        foregroundColor: _lightOnPrimary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: _lightOnPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.8,
        ),
        iconTheme: IconThemeData(color: _lightAccent),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: _lightSurface,
        selectedItemColor: _lightPrimary,
        unselectedItemColor: _lightSubtle,
        selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.w600, fontSize: 11),
        unselectedLabelStyle: TextStyle(fontSize: 11),
        elevation: 8,
        type: BottomNavigationBarType.fixed,
      ),
      cardTheme: CardThemeData(
        color: _lightSurface,
        elevation: 2,
        shadowColor: _lightPrimary.withOpacity(0.08),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _lightSurface,
        labelStyle: const TextStyle(color: _lightSubtle),
        hintStyle: const TextStyle(color: _lightSubtle),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: _lightAccent, width: 1.8),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: _lightSubtle.withOpacity(0.3)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: _lightError),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: _lightError, width: 1.8),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _lightPrimary,
          foregroundColor: _lightOnPrimary,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          textStyle: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: 0.5),
          elevation: 0,
        ),
      ),
      textTheme: const TextTheme(
        displaySmall: TextStyle(
            color: _lightOnSurface, fontSize: 28, fontWeight: FontWeight.w700),
        headlineMedium: TextStyle(
            color: _lightOnSurface, fontSize: 22, fontWeight: FontWeight.w700),
        headlineSmall: TextStyle(
            color: _lightOnSurface, fontSize: 18, fontWeight: FontWeight.w600),
        titleMedium: TextStyle(
            color: _lightOnSurface, fontSize: 15, fontWeight: FontWeight.w600),
        titleSmall: TextStyle(
            color: _lightSubtle, fontSize: 13, fontWeight: FontWeight.w500),
        bodyLarge: TextStyle(color: _lightOnSurface, fontSize: 15),
        bodyMedium: TextStyle(color: _lightSubtle, fontSize: 13),
        labelLarge: TextStyle(
            color: _lightOnPrimary, fontSize: 15, fontWeight: FontWeight.w600),
      ),
      dividerTheme:
          DividerThemeData(color: _lightSubtle.withOpacity(0.15), thickness: 1),
      chipTheme: ChipThemeData(
        backgroundColor: _lightAccent.withOpacity(0.12),
        labelStyle: const TextStyle(
            color: _lightPrimary, fontWeight: FontWeight.w600, fontSize: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        side: BorderSide.none,
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: _darkBackground,
      primaryColor: _darkPrimary,
      colorScheme: const ColorScheme.dark(
        primary: _darkPrimary,
        secondary: _darkAccent,
        surface: _darkSurface,
        error: _darkError,
        onPrimary: _darkOnPrimary,
        onSurface: _darkOnSurface,
        onError: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: _darkSurface,
        foregroundColor: _darkOnSurface,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: _darkOnSurface,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.8,
        ),
        iconTheme: IconThemeData(color: _darkPrimary),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: _darkSurface,
        selectedItemColor: _darkPrimary,
        unselectedItemColor: _darkSubtle,
        selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.w600, fontSize: 11),
        unselectedLabelStyle: TextStyle(fontSize: 11),
        elevation: 8,
        type: BottomNavigationBarType.fixed,
      ),
      cardTheme: CardThemeData(
        color: _darkSurface,
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _darkSurface,
        labelStyle: const TextStyle(color: _darkSubtle),
        hintStyle: const TextStyle(color: _darkSubtle),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: _darkAccent, width: 1.8),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: _darkSubtle.withOpacity(0.3)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: _darkError),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: _darkError, width: 1.8),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _darkPrimary,
          foregroundColor: _darkOnPrimary,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          textStyle: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: 0.5),
          elevation: 0,
        ),
      ),
      textTheme: const TextTheme(
        displaySmall: TextStyle(
            color: _darkOnSurface, fontSize: 28, fontWeight: FontWeight.w700),
        headlineMedium: TextStyle(
            color: _darkOnSurface, fontSize: 22, fontWeight: FontWeight.w700),
        headlineSmall: TextStyle(
            color: _darkOnSurface, fontSize: 18, fontWeight: FontWeight.w600),
        titleMedium: TextStyle(
            color: _darkOnSurface, fontSize: 15, fontWeight: FontWeight.w600),
        titleSmall: TextStyle(
            color: _darkSubtle, fontSize: 13, fontWeight: FontWeight.w500),
        bodyLarge: TextStyle(color: _darkOnSurface, fontSize: 15),
        bodyMedium: TextStyle(color: _darkSubtle, fontSize: 13),
        labelLarge: TextStyle(
            color: _darkOnPrimary, fontSize: 15, fontWeight: FontWeight.w600),
      ),
      dividerTheme:
          DividerThemeData(color: _darkSubtle.withOpacity(0.2), thickness: 1),
      chipTheme: ChipThemeData(
        backgroundColor: _darkAccent.withOpacity(0.15),
        labelStyle: const TextStyle(
            color: _darkPrimary, fontWeight: FontWeight.w600, fontSize: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        side: BorderSide.none,
      ),
    );
  }
}
