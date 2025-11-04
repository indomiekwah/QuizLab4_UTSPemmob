import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/dummy_questions.dart';
import '../models/question_model.dart';
import '../providers/quiz_provider.dart';
import '../widgets/primary_button.dart';
import '../widgets/quiz_option.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Gunakan Consumer untuk mendengarkan perubahan state
    return Consumer<QuizProvider>(
      builder: (context, provider, child) {
        final int index = provider.currentQuestionIndex;
        final Question currentQuestion = dummyQuestions[index];
        final bool isLastQuestion = index == provider.totalQuestions - 1;
        final int? selectedOption = provider.selectedAnswers[index];

        void handleNext() {
          if (selectedOption == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Silakan pilih satu jawaban!')),
            );
            return;
          }

          if (isLastQuestion) {
            // Navigasi ke halaman hasil
            Navigator.pushReplacementNamed(context, '/result');
          } else {
            // Pindah ke pertanyaan berikutnya
            provider.nextQuestion();
          }
        }

        return Scaffold(
          appBar: AppBar(
            title: Text("Pertanyaan ${index + 1}/${provider.totalQuestions}"), // [cite: 33]
            automaticallyImplyLeading: false,
          ),
          body: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 32.0),            
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Teks Pertanyaan
                Text(
                  currentQuestion.text,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 24),
                // Pilihan Jawaban
                Expanded(
                  child: ListView.builder(
                    itemCount: currentQuestion.options.length,
                    itemBuilder: (context, optionIndex) {
                      return QuizOption( // (Kriteria 6)
                        text: currentQuestion.options[optionIndex],
                        isSelected: selectedOption == optionIndex,
                        onTap: () {
                          provider.selectAnswer(index, optionIndex);
                        },
                      );
                    },
                  ),
                ),
                // Tombol "Lanjut" atau "Selesaikan"
                PrimaryButton( // (Kriteria 6)A````````\
                  text: isLastQuestion ? "Selesaikan Kuis" : "Lanjut", // [cite: 47]
                  onPressed: handleNext,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}