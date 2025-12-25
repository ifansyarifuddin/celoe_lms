import 'package:celoe_lms/core/app_colors.dart';
import 'package:flutter/material.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Komunitas UIM'),
          bottom: const TabBar(
            indicatorColor: AppColors.accent,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(text: 'Pengumuman'),
              Tab(text: 'Grup Diskusi'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildFeedTab(),
            _buildGroupsTab(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColors.primary,
          child: const Icon(Icons.add_comment_rounded),
        ),
      ),
    );
  }

  Widget _buildFeedTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      child: Icon(Icons.person, color: Colors.grey[400]),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          index % 2 == 0 ? 'BEM Universitas' : 'UKM Olahraga',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '2 Jam yang lalu',
                          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  index % 2 == 0
                      ? 'Pendaftaran Beasiswa Unggulan Tahap 2 telah dibuka! Segera daftarkan diri Anda sebelum tanggal 30 Desember.'
                      : 'Jangan lupa saksikan pertandingan Final Futsal antar fakultas besok pagi di GOR Utama.',
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.favorite_border, size: 20, color: Colors.grey),
                    const SizedBox(width: 4),
                    const Text('12', style: TextStyle(color: Colors.grey)),
                    const SizedBox(width: 16),
                    const Icon(Icons.comment_outlined, size: 20, color: Colors.grey),
                    const SizedBox(width: 4),
                    const Text('4', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildGroupsTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildGroupItem('Komunitas Programmer UIM', '120 Anggota', Icons.code),
        _buildGroupItem('Kajian Islam Rutin', '350 Anggota', Icons.mosque),
        _buildGroupItem('English Club', '85 Anggota', Icons.language),
        _buildGroupItem('Futsal UIM', '200 Anggota', Icons.sports_soccer),
      ],
    );
  }

  Widget _buildGroupItem(String title, String subtitle, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.secondary.withValues(alpha: 0.2),
          child: Icon(icon, color: AppColors.primary),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          child: const Text('Gabung', style: TextStyle(fontSize: 12)),
        ),
      ),
    );
  }
}
