import 'package:flutter/material.dart';

class AppColors {
  // Colores primarios basados en el logo (verde oscuro)
  static const Color primary = Color(0xFF008D34); // Verde principal del logo
  static const Color primaryLight = Color(
    0xFF33A15F,
  ); // Tono más claro de verde para acentos
  static const Color primaryDark = Color(
    0xFF00461A,
  ); // Tono más oscuro de verde para contraste

  // Colores secundarios (complementarios o neutros cálidos)
  static const Color secondary = Color(
    0xFFB0BEC5,
  ); // Gris azulado para elementos secundarios
  static const Color secondaryLight = Color(
    0xFFE2F1F8,
  ); // Tono más claro de secundario
  static const Color secondaryDark = Color(
    0xFF78909C,
  ); // Tono más oscuro de secundario

  // Colores terciarios (para acentos o estados específicos)
  static const Color tertiary = Color(
    0xFFFDD835,
  ); // Amarillo suave para acentos o advertencias
  static const Color tertiaryLight = Color(
    0xFFFFECB3,
  ); // Tono más claro de terciario
  static const Color tertiaryDark = Color(
    0xFFFBC02D,
  ); // Tono más oscuro de terciario

  // Colores de superficie y fondo
  static const Color background = Color(
    0xFFF5F5F5,
  ); // Fondo claro para la mayoría de las pantallas
  static const Color surface = Color(
    0xFFFFFFFF,
  ); // Superficie de elementos (tarjetas, diálogos)
  static const Color onBackground = Color(0xFF212121); // Texto sobre fondo
  static const Color onSurface = Color(0xFF212121); // Texto sobre superficie

  // Colores de texto y iconos
  static const Color textPrimary = Color(
    0xFF212121,
  ); // Texto principal (casi negro)
  static const Color textSecondary = Color(
    0xFF757575,
  ); // Texto secundario (gris oscuro)
  static const Color textLight = Color(
    0xFFBDBDBD,
  ); // Texto muy claro (gris claro)

  // Colores de estado
  static const Color error = Color(0xFFD32F2F); // Rojo para errores
  static const Color onError = Color(0xFFFFFFFF); // Texto sobre error
  static const Color success = Color(0xFF388E3C); // Verde para éxito
  static const Color warning = Color(0xFFFFA000); // Naranja para advertencias

  // Colores neutros (grises)
  static const Color gray50 = Color(0xFFFAFAFA);
  static const Color gray100 = Color(0xFFF5F5F5);
  static const Color gray200 = Color(0xFFEEEEEE);
  static const Color gray300 = Color(0xFFE0E0E0);
  static const Color gray400 = Color(0xFFBDBDBD);
  static const Color gray500 = Color(0xFF9E9E9E);
  static const Color gray600 = Color(0xFF757575);
  static const Color gray700 = Color(0xFF616161);
  static const Color gray800 = Color(0xFF424242);
  static const Color gray900 = Color(0xFF212121);

  // Colores con opacidad
  static Color primaryAlpha(double opacity) =>
      primary.withAlpha((opacity * 255).round());
  static Color secondaryAlpha(double opacity) =>
      secondary.withAlpha((opacity * 255).round());
  static Color backgroundAlpha(double opacity) =>
      background.withAlpha((opacity * 255).round());
  static Color surfaceAlpha(double opacity) =>
      surface.withAlpha((opacity * 255).round());
  static Color errorAlpha(double opacity) =>
      error.withAlpha((opacity * 255).round());

  // Transparente
  static const Color transparent = Color(0x00000000);
}
