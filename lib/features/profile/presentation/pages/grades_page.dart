import 'package:celoe_lms/core/app_colors.dart';
import 'package:flutter/material.dart';

class GradesPage extends StatelessWidget {
  const GradesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Nilai'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.school, color: AppColors.primary),
              ),
              title: Text('Flutter Masterclass Batch ${12 - index}'),
              subtitle: const Text('Selesai pada: 20 Des 2024'),
              trailing: Container(
                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                 decoration: BoxDecoration(
                   color: index == 0 ? Colors.orange.shade50 : Colors.green.shade50,
                   borderRadius: BorderRadius.circular(12),
                   border: Border.all(color: index == 0 ? Colors.orange : Colors.green),
                 ),
                 child: Text(
                   index == 0 ? '85 (A)' : '92 (A)',
                   style: TextStyle(
                     fontWeight: FontWeight.bold,
                     color: index == 0 ? Colors.orange.shade800 : Colors.green.shade800,
                   ),
                 ),
              ),
            ),
          );
        },
      ),
    );
  }
}
