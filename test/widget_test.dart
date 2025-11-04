// File: test/widget_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

// Ganti 'quiz_la4' dengan nama proyek Anda (nama di pubspec.yaml)
import 'package:quiz_la4/main.dart';
import 'package:quiz_la4/providers/quiz_provider.dart';

void main() {
  testWidgets('App renders SplashScreen', (WidgetTester tester) async {
    // Bangun widget aplikasi kita, lengkap dengan Provider
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => QuizProvider(),
        child: const QuizLabApp(), // Ini adalah kelas utama kita, bukan MyApp
      ),
    );

    // Verifikasi bahwa SplashScreen menampilkan teks 'QuizLab4'
    expect(find.text('QuizLab4'), findsOneWidget);
  });
}