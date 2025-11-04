// File: lib/providers/theme_provider.dart

import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  // Kita mulai dengan mode terang sebagai default
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  // Helper getter untuk tahu status saat ini
  bool get isDarkMode => _themeMode == ThemeMode.dark;

  // Fungsi untuk mengganti tema
  void toggleTheme() {
    _themeMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
    notifyListeners(); // Memberi tahu widget (seperti MaterialApp) untuk rebuild
  }
}