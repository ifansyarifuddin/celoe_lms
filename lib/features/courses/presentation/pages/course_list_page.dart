import 'package:celoe_lms/core/app_colors.dart';
import 'package:celoe_lms/features/home/presentation/widgets/course_card.dart';
import 'package:flutter/material.dart';

class CourseListPage extends StatelessWidget {
  const CourseListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Mata Kuliah Saya'),
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: AppColors.accent,
            tabs: [
              Tab(text: 'Aktif'),
              Tab(text: 'Selesai'),
              Tab(text: 'Pilihan'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildCourseList(), // Aktif
            _buildCourseList(isCompleted: true), // Selesai
            _buildCourseList(isOptional: true), // Pilihan
          ],
        ),
      ),
    );
  }

  Widget _buildCourseList({bool isCompleted = false, bool isOptional = false}) {
    // Only show empty state for 'Selesai' if logic demands, otherwise mock data
    // For this prototype, I'll populate all with mock data or specific message
    if (isCompleted) {
       return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.history_edu, size: 64, color: Colors.grey[300]),
            const SizedBox(height: 16),
            Text(
              'Belum ada mata kuliah selesai',
              style: TextStyle(color: Colors.grey[500]),
            ),
          ],
        ),
      );
    }
    
    // Mock for Pilihan
    if (isOptional) {
       return ListView.builder(
         padding: const EdgeInsets.all(16),
         itemCount: 2,
         itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              child: ListTile(
                leading: Container(
                  width: 50, height: 50,
                  decoration: BoxDecoration(color: Colors.orange.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)),
                  child: const Icon(Icons.star, color: Colors.orange),
                ),
                title: Text('Digital Marketing ${index + 1}'),
                subtitle: const Text('2 SKS - Prof. Marketing'),
                trailing: ElevatedButton(
                  onPressed: (){}, 
                  style: ElevatedButton.styleFrom(minimumSize: const Size(80, 36)),
                  child: const Text('Ambil'),
                ),
              ),
            );
         }
       );
    }
    
    return Column(
      children: [
         // Search & Filter
         Padding(
           padding: const EdgeInsets.all(16.0),
           child: TextField(
             decoration: InputDecoration(
               hintText: 'Cari mata kuliah...',
               prefixIcon: const Icon(Icons.search, color: Colors.grey),
               suffixIcon: Icon(Icons.tune, color: AppColors.primary),
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(12),
                 borderSide: BorderSide.none
               ),
               filled: true,
               fillColor: Colors.grey[100],
             ),
           ),
         ),

        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: GestureDetector(
                  onTap: () {
                     Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => const CourseDetailPage(courseTitle: 'Mobile App Development'))
                    );
                  },
                  child: SizedBox(
                     height: 250, 
                     child: CourseCard(
                      code: 'IF${2000 + index}',
                      title: 'Mobile App Development ${index + 1}',
                      instructor: 'Dr. Rofi',
                      progress: isCompleted ? 1.0 : 0.45,
                      imageUrl: 'assets/images/logo.png', // Placeholder
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class CourseDetailPage extends StatelessWidget {
  final String courseTitle;

  const CourseDetailPage({super.key, required this.courseTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: AppColors.primary,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(courseTitle, style: const TextStyle(fontSize: 16)),
              background: Image.asset(
                'assets/images/image.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Rencana Pembelajaran',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Mata kuliah ini membahas konsep dasar hingga lanjut pemrgoraman mobile dengan Flutter. Mahasiswa diharapkan mampu membuat aplikasi multi-platform.',
                      style: TextStyle(color: Colors.grey, height: 1.5),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Aktivitas Perkuliahan',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    _buildMeetingItem(context, '1', 'Pengantar Mobile Dev', true),
                    _buildMeetingItem(context, '2', 'Instalasi & Konfigurasi', true),
                    _buildMeetingItem(context, '3', 'Dart Fundamentals', true),
                    _buildMeetingItem(context, '4', 'Widget Basics', false),
                    _buildMeetingItem(context, '5', 'Layouting', false),
                    _buildMeetingItem(context, '6', 'State Management', false),
                    _buildMeetingItem(context, '7', 'Navigation', false),
                    _buildMeetingItem(context, '8', 'UTS (Ujian Tengah Semester)', false, isExam: true),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Lanjut Belajar'),
        ),
      ),
    );
  }

  Widget _buildMeetingItem(BuildContext context, String number, String title, bool isCompleted, {bool isExam = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isExam ? Colors.orange.withValues(alpha: 0.1) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isExam ? Colors.orange : Colors.grey.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Pertemuan $number',
                  style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 8),
              if (isCompleted)
                const Icon(Icons.check_circle, size: 16, color: Colors.green),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildActionButton(Icons.videocam_outlined, 'Video'),
              const SizedBox(width: 8),
              _buildActionButton(Icons.picture_as_pdf_outlined, 'Modul'),
              const SizedBox(width: 8),
              _buildActionButton(Icons.forum_outlined, 'Diskusi'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 14, color: AppColors.primary),
          const SizedBox(width: 4),
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.black87)),
        ],
      ),
    );
  }
}
