import 'package:flutter/material.dart';
// Tambahkan ini
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ph.dart'; // Impor data ikon 'Phosphor' (ph)
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/primary_button.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final _nameController = TextEditingController();
  final _nimController = TextEditingController();

  void _startQuiz() {
    if (_nameController.text.isNotEmpty && _nimController.text.isNotEmpty) {
      // Simpan nama & NIM ke provider
      Provider.of<QuizProvider>(
        context,
        listen: false,
      ).setUser(_nameController.text, _nimController.text);
      // Navigasi ke halaman kuis
      Navigator.pushReplacementNamed(context, '/quiz');
    } else {
      // Tampilkan snackbar jika data belum diisi
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nama dan NIM tidak boleh kosong!')),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // 2. 'WATCH' PROVIDER TEMA UNTUK TAHU IKON APA YANG HARUS DITAMPILKAN
    final themeProvider = context.watch<ThemeProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "QuizLab4", // Pindahkan judul ke sini
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [
          // Ini adalah tombol dark mode Anda
          IconButton(
            icon: Iconify(
              // Ganti ikon berdasarkan status
              themeProvider.isDarkMode ? Ph.sun_bold : Ph.moon_bold,
            ),
            onPressed: () {
              // Panggil fungsi toggle. Gunakan 'read' di dalam onPressed
              context.read<ThemeProvider>().toggleTheme();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05, // Ukuran dinamis
            vertical: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Selamat datang di QuizLab4!", // [cite: 21]
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Masukkan nama dan NIM anda sebelum menjawab soal", // [cite: 22]
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: Colors.grey[600]),
              ),
              const SizedBox(height: 40),
              // Input Nama
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Nama",
                  hintText: "Masukkan nama",
                  prefixIcon: Iconify(
                    Ph.user, // Ikon dari Iconify (Kriteria 85)
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Input NIM
              TextField(
                controller: _nimController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "NIM",
                  hintText: "Masukkan NIM",
                  prefixIcon: Iconify(
                    Ph.student, // Ikon dari Iconify (Kriteria 85)
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // Tombol menggunakan reusable widget
              PrimaryButton(
                text: "Masuk ke Quiz", // [cite: 31]
                onPressed: _startQuiz,
              ),
            ],
          ),
        ),
    );
  }
}
