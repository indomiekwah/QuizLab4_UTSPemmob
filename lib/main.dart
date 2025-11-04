import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'providers/quiz_provider.dart';
import 'screens/splash_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/result_screen.dart';
import 'providers/theme_provider.dart';

void main() {
  runApp(
    // 2. GUNAKAN MultiProvider
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => QuizProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()), // Daftarkan di sini
      ],
      child: const QuizLabApp(),
    ),
  );
}

class QuizLabApp extends StatelessWidget {
  const QuizLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Tentukan tema terang (Light Theme)
    final lightTheme = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
      textTheme: GoogleFonts.plusJakartaSansTextTheme(
        ThemeData.light().textTheme,
      ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );

    // 2. Tentukan tema gelap (Dark Theme)
    final darkTheme = ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
      textTheme: GoogleFonts.plusJakartaSansTextTheme(
        ThemeData.dark().textTheme,
      ),
      scaffoldBackgroundColor: const Color(0xFF121212), // Warna latar belakang gelap umum
      // Anda bisa menyesuaikan warna lain di sini
      // contoh:
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF1F1F1F), // Warna app bar sedikit lebih terang
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.white.withAlpha(200),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    );
    
    final themeProvider = context.watch<ThemeProvider>();

    // 3. Terapkan di MaterialApp
    return MaterialApp(
      title: 'QuizLab4',
      
      // -- PERUBAHAN DI SINI --
      themeMode: themeProvider.themeMode, // <-- Ganti dari ThemeMode.system
      
      theme: lightTheme,
      darkTheme: darkTheme,
      
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/menu': (context) => const MenuScreen(),
        '/quiz': (context) => const QuizScreen(),
        '/result': (context) => const ResultScreen(),
      },
    );
  }
}