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
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.withOpacity(0.1)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.primary.withOpacity(0.1),
                      child: Icon(Icons.person, color: AppColors.primary),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            index % 2 == 0 ? 'BEM Universitas' : 'UKM Olahraga',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          Row(
                            children: [
                              Text(
                                '2 Jam yang lalu',
                                style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                              ),
                              const SizedBox(width: 4),
                              Icon(Icons.public, size: 12, color: Colors.grey[400]),
                            ],
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_horiz),
                      onPressed: () {},
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              
              // Content
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      index % 2 == 0
                          ? 'Pendaftaran Beasiswa Unggulan Tahap 2 telah dibuka! Segera daftarkan diri Anda sebelum tanggal 30 Desember. #Beasiswa #UIM'
                          : 'Jangan lupa saksikan pertandingan Final Futsal antar fakultas besok pagi di GOR Utama. Ayo dukung tim fakultasmu! ⚽🔥',
                      style: const TextStyle(fontSize: 14, height: 1.5),
                    ),
                    const SizedBox(height: 12),
                    if (index % 2 != 0) // Mock Image Attachment
                      Container(
                        height: 180,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                             image: AssetImage('assets/images/logo.png'), // Placeholder
                             fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              // Actions
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildActionButton(Icons.thumb_up_alt_outlined, 'Suka (12)'),
                    _buildActionButton(Icons.comment_outlined, 'Komentar (4)'),
                    _buildActionButton(Icons.share_outlined, 'Bagikan'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 20, color: Colors.grey[600]),
      label: Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
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
          backgroundColor: AppColors.secondary.withOpacity(0.2),
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
