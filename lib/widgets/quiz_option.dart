import 'package:flutter/material.dart';

class QuizOption extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const QuizOption({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // 1. Dapatkan warna teks default dari tema saat ini
    // Ini akan otomatis menjadi putih di dark mode dan hitam di light mode
    final defaultTextColor = Theme.of(context).textTheme.bodyLarge?.color;

    // 2. Buat warna border dinamis
    // (Abu-abu muda di light mode, abu-abu tua di dark mode)
    final defaultBorderColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.grey[700]!
        : Colors.grey[300]!;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Ink(
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue.withAlpha(26) : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              // 3. Gunakan warna border dinamis
              color: isSelected ? Colors.blue : defaultBorderColor,
              width: 2,
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              // 4. GANTI 'Colors.black' DENGAN 'defaultTextColor'
              color: isSelected ? Colors.blue[800] : defaultTextColor,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}