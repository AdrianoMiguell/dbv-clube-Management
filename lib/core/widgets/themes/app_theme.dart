import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTheme {
  static ThemeData temaPadrao() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Color.fromARGB(255, 46, 0, 19),
        brightness: Brightness.light,
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        titleMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        titleSmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        bodySmall: TextStyle(fontSize: 11, fontWeight: FontWeight.normal),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)))
        )
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.transparent, // ou a cor de fundo dos seus TextFields
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        hoverColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade400, width: 2),
        ),
      ),
      fontFamily: 'Inter',
      useMaterial3: true,
    );
  }
}

class AppColors {
  static Color get primary => Theme.of(Get.context!).colorScheme.primary;
  static Color get onPrimary => Theme.of(Get.context!).colorScheme.onPrimary;
  static Color get primaryContainer =>
      Theme.of(Get.context!).colorScheme.primaryContainer;
  static Color get secondary => Theme.of(Get.context!).colorScheme.secondary;
  static Color get onSecondary =>
      Theme.of(Get.context!).colorScheme.onSecondary;
  static Color get secondaryContainer =>
      Theme.of(Get.context!).colorScheme.secondaryContainer;
  static Color get tertiary => Theme.of(Get.context!).colorScheme.tertiary;
  static Color get onTertiary => Theme.of(Get.context!).colorScheme.onTertiary;
  static Color get tertiaryContainer =>
      Theme.of(Get.context!).colorScheme.tertiaryContainer;
  static Color get error => Theme.of(Get.context!).colorScheme.error;
  static Color get onError => Theme.of(Get.context!).colorScheme.onError;
  static Color get errorContainer =>
      Theme.of(Get.context!).colorScheme.errorContainer;
  static Color get surface => Theme.of(Get.context!).colorScheme.surface;
  static Color get onSurface => Theme.of(Get.context!).colorScheme.onSurface;
  static Color get surfaceContainer =>
      Theme.of(Get.context!).colorScheme.surfaceContainer;
}

class AppText {
  static TextStyle? get titleLarge =>
      Theme.of(Get.context!).textTheme.titleLarge;
  static TextStyle? get titleMedium =>
      Theme.of(Get.context!).textTheme.titleMedium;
  static TextStyle? get titleSmall =>
      Theme.of(Get.context!).textTheme.titleSmall;
  static TextStyle? get bodyLarge => Theme.of(Get.context!).textTheme.bodyLarge;
  static TextStyle? get bodyMedium =>
      Theme.of(Get.context!).textTheme.bodyMedium;
  static TextStyle? get bodySmall => Theme.of(Get.context!).textTheme.bodySmall;
  static TextStyle? get labelLarge =>
      Theme.of(Get.context!).textTheme.labelLarge;
  static TextStyle? get labelMedium =>
      Theme.of(Get.context!).textTheme.labelMedium;
  static TextStyle? get labelSmall =>
      Theme.of(Get.context!).textTheme.labelSmall;
}
