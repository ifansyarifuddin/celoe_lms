import 'package:celoe_lms/core/app_colors.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            const Text(
              'Pertanyaan 1 dari 20',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            const Text(
              'Manakah widget di bawah ini yang digunakan untuk membuat layout baris di Flutter?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            _buildOption(context, 'A', 'Column'),
            _buildOption(context, 'B', 'Row', isSelected: true),
            _buildOption(context, 'C', 'Stack'),
            _buildOption(context, 'D', 'Container'),
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
            OutlinedButton(onPressed: (){}, child: const Text('Sebelumnya')),
            Wrap(
              spacing: 8,
              children: List.generate(5, (index) => Container(
                width: 10, height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == 0 ? AppColors.primary : Colors.grey[300],
                ),
              )),
            ),
            ElevatedButton(
              onPressed: (){}, 
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: Colors.white),
              child: const Text('Selanjutnya')
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(BuildContext context, String label, String text, {bool isSelected = false}) {
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
      child: RadioListTile(
        value: label,
        groupValue: isSelected ? label : null,
        onChanged: (val) {},
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
