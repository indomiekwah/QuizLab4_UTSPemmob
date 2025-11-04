import 'package:flutter/material.dart';
import '../data/dummy_questions.dart';

class QuizProvider extends ChangeNotifier {
  String _userName = "";
  String _userNIM = "";
  int _currentQuestionIndex = 0;
  final Map<int, int> _selectedAnswers = {}; // Menyimpan jawaban (index soal, index jawaban)
  
  // Getters
  String get userName => _userName;
  String get userNIM => _userNIM;
  int get currentQuestionIndex => _currentQuestionIndex;
  int get totalQuestions => dummyQuestions.length;
  Map<int, int> get selectedAnswers => _selectedAnswers;

  // Mendapatkan skor akhir (Kriteria 75)
  int get score {
    int correctAnswers = 0;
    _selectedAnswers.forEach((questionIndex, selectedOptionIndex) {
      if (dummyQuestions[questionIndex].correctAnswerIndex == selectedOptionIndex) {
        correctAnswers++;
      }
    });
    return correctAnswers * 20; // (Benar soal * 20)
  }

  // Setters
  void setUser(String name, String nim) {
    _userName = name;
    _userNIM = nim;
    notifyListeners();
  }

  void selectAnswer(int questionIndex, int optionIndex) {
    _selectedAnswers[questionIndex] = optionIndex;
    notifyListeners();
  }

  void nextQuestion() {
    if (_currentQuestionIndex < totalQuestions - 1) {
      _currentQuestionIndex++;
      notifyListeners();
    }
  }

  // Untuk tombol "Ulangi"
  void resetQuiz() {
    _userName = "";
    _userNIM = "";
    _currentQuestionIndex = 0;
    _selectedAnswers.clear();
    notifyListeners();
  }
}