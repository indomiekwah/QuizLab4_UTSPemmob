import '../models/question_model.dart';

// Data dummy berdasarkan gambar dari PDF
final List<Question> dummyQuestions = [
  Question(
    text: "Widget utama yang digunakan sebagai titik awal aplikasi Flutter adalah...", // [cite: 34]
    options: ["Container", "MaterialApp", "Scaffold", "Text"], // [cite: 36, 37, 38, 39]
    correctAnswerIndex: 1,
  ),
  Question(
    text: "Bahasa pemrograman yang digunakan untuk membangun aplikasi Flutter adalah...", // [cite: 42]
    options: ["Java", "Kotlin", "Dart", "Swift"], // [cite: 43, 44, 45, 46]
    correctAnswerIndex: 2,
  ),
  Question(
    text: "Widget yang digunakan untuk menampilkan teks di Flutter adalah...", // [cite: 50]
    options: ["Label", "TextView", "Text", "String"], // [cite: 52, 53, 54, 55]
    correctAnswerIndex: 2,
  ),
  Question(
    text: "Fungsi setState() digunakan untuk...", // [cite: 59]
    options: ["Menghapus widget", "Menutup aplikasi", "Memperbarui tampilan ketika data berubah", "Membuka aplikasi"], // [cite: 60, 61, 62, 63]
    correctAnswerIndex: 2,
  ),
  Question(
    text: "Perintah untuk menjalankan aplikasi Flutter di emulator atau perangkat adalah...", // [cite: 67]
    options: ["flutter create", "flutter build", "flutter run", "flutter start"], // [cite: 69, 70, 71, 72]
    correctAnswerIndex: 2,
  ),
];