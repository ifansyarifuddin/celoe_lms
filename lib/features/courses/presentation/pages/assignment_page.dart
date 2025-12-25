import 'package:celoe_lms/core/app_colors.dart';
import 'package:flutter/material.dart';

class AssignmentPage extends StatelessWidget {
  const AssignmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Tugas'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.red.shade100),
              ),
              child: Row(
                children: [
                  const Icon(Icons.timer_outlined, color: Colors.red),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Batas Waktu', style: TextStyle(color: Colors.red)),
                      Text(
                        'Senin, 30 Des 2025, 23:59 WIB',
                        style: TextStyle(
                          color: Colors.red.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
             const Text(
              'Tugas 1: Analisis UI/UX',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Buatlah analisis perbandingan antara aplikasi Gojek dan Grab dari sisi User Experience. \n\nKetentuan:\n1. Format PDF\n2. Minimal 5 halaman\n3. Sertakan screenshot',
              style: TextStyle(fontSize: 16, height: 1.5, color: Colors.black87),
            ),
            const SizedBox(height: 32),
            const Text(
              'File Tugas',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                   const Icon(Icons.cloud_upload_outlined, size: 48, color: Colors.grey),
                   const SizedBox(height: 8),
                   const Text('Tap untuk upload file', style: TextStyle(color: Colors.grey)),
                   const SizedBox(height: 16),
                   OutlinedButton(
                     onPressed: (){},
                     child: const Text('Pilih File'),
                   )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black12)],
        ),
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Tugas berhasil dikumpulkan!'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: const Text('Kumpulkan Tugas', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
