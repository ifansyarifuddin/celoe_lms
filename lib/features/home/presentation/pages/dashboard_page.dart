import 'package:celoe_lms/core/app_colors.dart';
import 'package:celoe_lms/features/home/presentation/widgets/course_card.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50], // Slightly off-white background
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=12'), // Placeholder
              radius: 20,
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Assalamualaikum,',
                  style: TextStyle(fontSize: 12, color: Colors.white70),
                ),
                Text(
                  'Ahmad Ifan', // Mock Name
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined, color: Colors.white),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header / Academic Summary
            Container(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 16),
              decoration: const BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildAcademicItem('IPK Terakhir', '3.85', Icons.star_border),
                    Container(height: 40, width: 1, color: Colors.grey[300]),
                    _buildAcademicItem('SKS Diambil', '24', Icons.book_outlined),
                    Container(height: 40, width: 1, color: Colors.grey[300]),
                    _buildAcademicItem('Semester', '5', Icons.timeline),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Menu Cepat (Grid)
                  Text(
                    'Menu Cepat',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildMenuIcon(context, 'Jadwal', Icons.calendar_month, Colors.blue),
                      _buildMenuIcon(context, 'Nilai', Icons.assignment_turned_in, Colors.orange),
                      _buildMenuIcon(context, 'Perpus', Icons.local_library, Colors.purple),
                      _buildMenuIcon(context, 'Keuangan', Icons.monetization_on, Colors.green),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Course In Progress
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sedang Dipelajari',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Lihat Semua', style: TextStyle(color: AppColors.primary)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 220,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: CourseCard(
                            title: index == 0 ? 'Pemrograman Mobile' : (index == 1 ? 'Teknologi Cloud' : 'Basis Data'),
                            instructor: 'Dr. Rofi',
                            progress: index == 0 ? 0.75 : 0.3,
                            imageUrl: 'assets/images/logo.png', // Placeholder
                          ),
                        );
                      },
                    ),
                  ),
                  
                  const SizedBox(height: 24),

                  // Announcement
                  Text(
                    'Pengumuman',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 12),
                  _buildAnnouncementCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAcademicItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: AppColors.primary, size: 20),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 10, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildMenuIcon(BuildContext context, String label, IconData icon, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildAnnouncementCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.campaign, color: AppColors.primary),
              SizedBox(width: 8),
              Text(
                'Informasi Akademik',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Batas akhir pembayaran SPP Semester Genap adalah tanggal 20 Januari 2026.',
            style: TextStyle(color: Colors.grey[800], fontSize: 13),
          ),
        ],
      ),
    );
  }
}
