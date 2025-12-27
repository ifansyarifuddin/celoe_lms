import 'package:celoe_lms/core/app_colors.dart';
import 'package:celoe_lms/features/home/presentation/widgets/course_card.dart';
import 'package:celoe_lms/features/notifications/presentation/pages/notification_page.dart';
import 'package:celoe_lms/features/profile/presentation/pages/profile_page.dart';
import 'package:celoe_lms/features/profile/presentation/pages/grades_page.dart';
import 'package:celoe_lms/features/home/presentation/pages/calendar_page.dart';
import 'package:celoe_lms/features/home/presentation/pages/announcement_page.dart';
import 'package:celoe_lms/features/courses/presentation/pages/course_list_page.dart';
import 'package:celoe_lms/features/home/presentation/pages/assignment_list_page.dart';
import 'package:celoe_lms/features/courses/presentation/pages/assignment_page.dart';
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
            GestureDetector(
              onTap: () {
                  Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const ProfilePage())
                );
              },
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/profile_pic.png'),
                radius: 20,
              ),
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
                  'Ifan Syarifuddin', // Mock Name
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
            onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationPage()));
            },
            icon: const Icon(Icons.notifications_outlined, color: Colors.white),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Banner Slider (Info Update)
            SizedBox(
              height: 180,
              child: PageView(
                children: [
                  _buildBannerItem(Colors.red.shade900, "Selamat Datang di CeLOE LMS", "Mulai pembelajaran digital Anda sekarang."),
                  _buildBannerItem(Colors.blue.shade800, "Webinar Teknologi", "Ikuti webinar tentang Cloud Computing besok."),
                  _buildBannerItem(Colors.orange.shade800, "Pengumuman Akademik", "Cek jadwal ujian akhir semester."),
                ],
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
                  // Quick Access Menu
                  // Quick Access Menu
            _buildMenuGrid(context),
            const SizedBox(height: 24),

                   // Upcoming Assignments (formerly Recent Activity)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tugas Tenggat',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      TextButton(
                        child: const Text('Lihat Semua', style: TextStyle(color: AppColors.primary)),
                        onPressed: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context) => const AssignmentListPage()));
                        },
                      ),
                    ],
                  ),
                  _buildAssignmentItem(context, "Pemrograman Mobile", "Analisis UI/UX", "Besok, 23:59", true),
                  _buildAssignmentItem(context, "Basis Data", "ERD Diagram Project", "3 Hari lagi", false),
                  
                  const SizedBox(height: 24),

                  // Announcement (Secondary)
                   Text(
                    'Pengumuman',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const AnnouncementPage()));
                    },
                    child: _buildAnnouncementCard(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBannerItem(Color color, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAssignmentItem(BuildContext context, String course, String task, String deadline, bool isUrgent) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey.shade200)
      ),
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
        title: Text(course, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(task, style: const TextStyle(fontSize: 12)),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.access_time, size: 12, color: isUrgent ? Colors.red : Colors.grey),
                const SizedBox(width: 4),
                Text(
                  deadline, 
                  style: TextStyle(
                    fontSize: 11, 
                    color: isUrgent ? Colors.red : Colors.grey,
                    fontWeight: isUrgent ? FontWeight.bold : FontWeight.normal
                  )
                ),
              ],
            )
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
      ),
    );
  }

  Widget _buildMenuGrid(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {'icon': Icons.menu_book, 'label': 'Kursus', 'color': Colors.blue, 'page': const CourseListPage()},
      {'icon': Icons.calendar_month, 'label': 'Jadwal', 'color': Colors.orange, 'page': const CalendarPage()},
      {'icon': Icons.grade, 'label': 'Nilai', 'color': Colors.green, 'page': const GradesPage()},
    ];

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: menuItems.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.8,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        final item = menuItems[index];
        return GestureDetector(
          onTap: () {
            if (item['page'] != null) {
               Navigator.push(context, MaterialPageRoute(builder: (context) => item['page']));
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: (item['color'] as Color).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(item['icon'] as IconData, color: item['color'] as Color, size: 28),
              ),
              const SizedBox(height: 8),
              Text(
                item['label'] as String,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
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

  Widget _buildAnnouncementCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
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
