import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../widgets/primary_button.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Hanya perlu membaca state sekali, jadi 'watch'
    final provider = context.watch<QuizProvider>();
    final score = provider.score;
    final userName = provider.userName;

    void restartQuiz() {
      // Reset state dan kembali ke menu
      context.read<QuizProvider>().resetQuiz();
      Navigator.pushReplacementNamed(context, '/menu');
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Anda telah menyelesaikan\nQuizLab4, $userName!", // [cite: 76, 77]
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 24),
              Text(
                "Hasil skor anda adalah", // [cite: 78]
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                "$score", // [cite: 79]
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge
                    ?.copyWith(fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              const SizedBox(height: 48),
              Text(
                "Terima kasih telah menggunakan aplikasi", // [cite: 80]
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                text: "Ulangi", // [cite: 81]
                onPressed: restartQuiz,
              ),
            ],
          ),
        ),
      ),
    );
  }
}