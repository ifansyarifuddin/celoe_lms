import 'package:celoe_lms/core/app_colors.dart';
import 'package:celoe_lms/features/courses/presentation/pages/assignment_page.dart';
import 'package:flutter/material.dart';

class AssignmentListPage extends StatelessWidget {
  const AssignmentListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Tugas'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5,
        itemBuilder: (context, index) {
          final isUrgent = index < 2;
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AssignmentPage()));
              },
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isUrgent ? Colors.red.withOpacity(0.1) : Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.assignment_outlined, color: isUrgent ? Colors.red : Colors.blue),
              ),
              title: Text('Tugas ${index + 1}: Analisis Sistem', style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mata Kuliah: Pemrograman Mobile ${index + 1}'),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 14, color: isUrgent ? Colors.red : Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        isUrgent ? 'Besok, 23:59 WIB' : '3 Hari lagi',
                        style: TextStyle(
                          color: isUrgent ? Colors.red : Colors.grey,
                          fontWeight: isUrgent ? FontWeight.bold : FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: const Icon(Icons.chevron_right, color: Colors.grey),
            ),
          );
        },
      ),
    );
  }
}
