import 'package:celoe_lms/core/app_colors.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  final Map<int, String> _userAnswers = {};

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Manakah widget di bawah ini yang digunakan untuk membuat layout baris di Flutter?',
      'options': {
        'A': 'Column',
        'B': 'Row', // Correct
        'C': 'Stack',
        'D': 'Container'
      },
      'correctAnswer': 'B'
    },
    {
      'question': 'Fungsi utama dari setState() adalah...',
      'options': {
        'A': 'Membangun ulang UI', // Correct
        'B': 'Menghapus widget',
        'C': 'Membuat animasi',
        'D': 'Navigasi halaman'
      },
      'correctAnswer': 'A'
    },
     {
      'question': 'File konfigurasi utama untuk aset dan dependensi di Flutter adalah...',
      'options': {
        'A': 'main.dart',
        'B': 'README.md',
        'C': 'pubspec.yaml', // Correct
        'D': 'AndroidManifest.xml'
      },
      'correctAnswer': 'C'
    },
  ];

  void _selectAnswer(String answerCode) {
    setState(() {
      _userAnswers[_currentQuestionIndex] = answerCode;
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    }
  }

  void _prevQuestion() {
    if (_currentQuestionIndex > 0) {
      setState(() {
        _currentQuestionIndex--;
      });
    }
  }

  void _finishQuiz() {
    int score = 0;
    _questions.asMap().forEach((index, q) {
      if (_userAnswers[index] == q['correctAnswer']) {
        score++;
      }
    });

    double finalScore = (score / _questions.length) * 100;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Column(
          children: [
            Icon(Icons.emoji_events, size: 48, color: Colors.orange),
            SizedBox(height: 8),
            Text('Kuis Selesai!', textAlign: TextAlign.center),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Nilai Anda'),
            Text(
              '${finalScore.toInt()}',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: AppColors.primary),
            ),
            const SizedBox(height: 8),
            Text(
              finalScore >= 70 ? 'Selamat! Anda lulus.' : 'Belajar lagi ya!',
              style: TextStyle(color: finalScore >= 70 ? Colors.green : Colors.red),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Close page
            },
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kuis 1: Basic Flutter'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.orange),
            ),
            child: Row(
              children: [
                const Icon(Icons.timer, size: 16, color: Colors.orange),
                const SizedBox(width: 4),
                Text(
                  '45:00',
                  style: TextStyle(
                    color: Colors.orange.shade800,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pertanyaan ${_currentQuestionIndex + 1} dari ${_questions.length}',
              style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            Text(
              question['question'],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            ...(question['options'] as Map<String, String>).entries.map((entry) {
              return _buildOption(entry.key, entry.value, _userAnswers[_currentQuestionIndex] == entry.key);
            }),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black12)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (_currentQuestionIndex > 0)
              OutlinedButton(onPressed: _prevQuestion, child: const Text('Sebelumnya'))
            else
              const SizedBox(width: 80), // Placeholder

            Wrap(
              spacing: 8,
              children: List.generate(_questions.length, (index) => Container(
                width: 10, height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentQuestionIndex == index ? AppColors.primary : Colors.grey[300],
                ),
              )),
            ),

            if (_currentQuestionIndex < _questions.length - 1)
              ElevatedButton(
                onPressed: _nextQuestion,
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: Colors.white),
                child: const Text('Selanjutnya')
              )
            else
              ElevatedButton(
                onPressed: _finishQuiz,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
                child: const Text('Selesai')
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(String label, String text, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary.withOpacity(0.1) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? AppColors.primary : Colors.grey.shade300,
          width: isSelected ? 2 : 1,
        ),
      ),
      child: RadioListTile<String>(
        value: label,
        groupValue: isSelected ? label : null,
        onChanged: (val) {
          if (val != null) _selectAnswer(val);
        },
        activeColor: AppColors.primary,
        title: Text(text, style: TextStyle(fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
        secondary: CircleAvatar(
          backgroundColor: isSelected ? AppColors.primary : Colors.grey[200],
          radius: 14,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12, 
              color: isSelected ? Colors.white : Colors.grey[600],
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
