import 'package:celoe_lms/core/app_colors.dart';
import 'package:flutter/material.dart';

class AnnouncementPage extends StatelessWidget {
  const AnnouncementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengumuman LMS'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: 3,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final titles = [
            'Maintenance Server LMS',
            'Update Fitur Mobile App v2.0',
            'Panduan Akses E-Library',
          ];
          final contents = [
            'Akan dilakukan pemeliharaan server pada hari Sabtu, 28 Desember 2024 pukul 22.00 - 05.00 WIB. Selama periode ini, LMS tidak dapat diakses. Mohon simpan pekerjaan Anda sebelumnya.',
            'Aplikasi CeLOE LMS kini hadir dengan tampilan baru! Nikmati fitur Dark Mode, Navigasi lebih cepat, dan akses materi offline. Silakan update melalui Play Store/App Store.',
            'Mahasiswa kini dapat mengakses ribuan e-book internasional melalui menu Perpustakaan Digital. Gunakan akun SSO universitas untuk login.',
          ];

          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Row(
                     children: [
                       Container(
                         padding: const EdgeInsets.all(8),
                         decoration: BoxDecoration(
                           color: AppColors.primary.withOpacity(0.1),
                           borderRadius: BorderRadius.circular(8),
                         ),
                         child: const Icon(Icons.campaign, color: AppColors.primary),
                       ),
                       const SizedBox(width: 12),
                       Expanded(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(
                               titles[index],
                               style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                             ),
                             const Text(
                               'Admin LMS - 5 Jam yang lalu',
                               style: TextStyle(color: Colors.grey, fontSize: 12),
                             ),
                           ],
                         ),
                       ),
                     ],
                   ),
                   const SizedBox(height: 12),
                   Text(
                     contents[index],
                     style: TextStyle(color: Colors.grey[800], height: 1.5),
                   ),
                 
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
