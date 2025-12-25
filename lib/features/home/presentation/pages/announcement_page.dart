import 'package:celoe_lms/core/app_colors.dart';
import 'package:flutter/material.dart';

class AnnouncementPage extends StatelessWidget {
  const AnnouncementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengumuman Akademik'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: 3,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
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
                       const Expanded(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(
                               'Pembayaran SPP Semester Genap',
                               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                             ),
                             Text(
                               '20 Desember 2025',
                               style: TextStyle(color: Colors.grey, fontSize: 12),
                             ),
                           ],
                         ),
                       ),
                     ],
                   ),
                   const SizedBox(height: 12),
                   Text(
                     index == 0 
                      ? 'Diberitahukan kepada seluruh mahasiswa bahwa batas akhir pembayaran SPP untuk Semester Genap Tahun Ajaran 2025/2026 adalah tanggal 20 Januari 2026. Mohon segera melakukan pembayaran sebelum tanggal tersebut untuk menghindari denda administrasi.'
                      : 'Jadwal pengisian Kartu Rencana Studi (KRS) akan dimulai pada tanggal 25 Januari 2026. Pastikan seluruh kewajiban administrasi telah diselesaikan.',
                     style: TextStyle(color: Colors.grey[800], height: 1.5),
                   ),
                   const SizedBox(height: 16),
                   SizedBox(
                     width: double.infinity,
                     child: OutlinedButton(
                       onPressed: (){},
                       style: OutlinedButton.styleFrom(foregroundColor: AppColors.primary),
                       child: const Text('Unduh Lampiran'),
                     ),
                   )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
