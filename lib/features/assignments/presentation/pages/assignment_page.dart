import 'package:celoe_lms/core/app_colors.dart';
import 'package:flutter/material.dart';

class AssignmentPage extends StatelessWidget {
  const AssignmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas & Kuis'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Tenggat Waktu Terdekat',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildAssignmentCard(
            title: 'Laporan Praktikum Modul 4',
            course: 'Pemrograman Mobile',
            deadline: 'Hari ini, 23:59',
            isUrgent: true,
            status: 'Belum Dikumpul',
          ),
          _buildAssignmentCard(
            title: 'Quiz Bab 3: Normalisasi',
            course: 'Basis Data',
            deadline: 'Besok, 10:00',
            isUrgent: false,
            status: 'Belum Dikerjakan',
          ),
          _buildAssignmentCard(
            title: 'Essay: Etika Profesi',
            course: 'Etika Profesi',
            deadline: '28 Des 2025',
            isUrgent: false,
            status: 'Sudah Dikumpul',
            isDone: true,
          ),
        ],
      ),
    );
  }

  Widget _buildAssignmentCard({
    required String title,
    required String course,
    required String deadline,
    required bool isUrgent,
    required String status,
    bool isDone = false,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: isDone
                        ? Colors.green[50]
                        : (isUrgent ? Colors.red[50] : Colors.blue[50]),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: isDone
                          ? Colors.green
                          : (isUrgent ? Colors.red : Colors.blue),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(
                  Icons.access_time_rounded,
                  size: 18,
                  color: isUrgent ? Colors.red : Colors.grey,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(course, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  'Deadline: $deadline',
                  style: TextStyle(
                    color: isUrgent ? Colors.red : Colors.grey[800],
                    fontWeight: isUrgent ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                const Spacer(),
                if (!isDone)
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.upload_file, size: 16),
                    label: const Text('Upload'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
