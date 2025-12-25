import 'package:celoe_lms/core/app_colors.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
             icon: const Icon(Icons.done_all, color: AppColors.primary),
             onPressed: () {},
             tooltip: 'Tandai semua sudah dibaca',
          )
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: 8,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final isUnread = index < 3;
          return ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Stack(
              children: [
                CircleAvatar(
                  backgroundColor: _getIconColor(index).withOpacity(0.1),
                  child: Icon(_getIcon(index), color: _getIconColor(index)),
                ),
                if (isUnread)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            title: Text(
              _getTitle(index),
              style: TextStyle(
                fontWeight: isUnread ? FontWeight.bold : FontWeight.normal,
                fontSize: 14,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  _getDescription(index),
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '${index + 2} jam yang lalu',
                  style: TextStyle(fontSize: 10, color: Colors.grey[400]),
                ),
              ],
            ),
            onTap: () {},
          );
        },
      ),
    );
  }

  IconData _getIcon(int index) {
    if (index % 3 == 0) return Icons.assignment_outlined;
    if (index % 3 == 1) return Icons.info_outline;
    return Icons.chat_bubble_outline;
  }

  Color _getIconColor(int index) {
    if (index % 3 == 0) return Colors.orange;
    if (index % 3 == 1) return Colors.blue;
    return Colors.green;
  }

  String _getTitle(int index) {
    if (index % 3 == 0) return 'Tugas Baru: Mobile Programming';
    if (index % 3 == 1) return 'Info Akademik';
    return 'Balasan di Forum Diskusi';
  }

  String _getDescription(int index) {
    if (index % 3 == 0) return 'Dosen telah menambahkan tugas baru "Project Akhir". Batas waktu: 30 Des 2025.';
    if (index % 3 == 1) return 'Jadwal UAS Semester Ganjil 2024/2025 telah dirilis. Silakan cek di menu Jadwal.';
    return 'Budi menjawab pertanyaan Anda di topik "State Management di Flutter".';
  }
}
