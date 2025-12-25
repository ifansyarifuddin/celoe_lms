import 'package:celoe_lms/core/app_colors.dart';
import 'package:celoe_lms/features/courses/presentation/pages/quiz_page.dart'; // Added
import 'package:celoe_lms/features/courses/presentation/pages/assignment_page.dart'; // Added
import 'package:flutter/material.dart';

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
            foregroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                courseTitle, 
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
              ),
              background: Stack(
                 fit: StackFit.expand,
                 children: [
                    Image.asset(
                      'assets/images/logo.png', // Placeholder
                      fit: BoxFit.cover,
                    ),
                    Container(
                      color: AppColors.primary.withValues(alpha: 0.8), // Overlay
                    )
                 ],
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
                      'Deskripsi Mata Kuliah',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Mata kuliah ini membahas konsep dasar hingga lanjut pemrograman mobile dengan Flutter. Mahasiswa diharapkan mampu membuat aplikasi multi-platform yang responsif dan performan.',
                      style: TextStyle(color: Colors.grey, height: 1.5),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Rencana Pembelajaran',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    _buildWeeklyItem(context, '1', 'Pengantar Mobile Development', true, [
                       _buildMaterialItem(context, Icons.videocam_outlined, 'Video Pengantar', 'Video'),
                       _buildMaterialItem(context, Icons.picture_as_pdf_outlined, 'Silabus Mata Kuliah.pdf', 'Dokumen'),
                    ]),
                    _buildWeeklyItem(context, '2', 'Instalasi & Konfigurasi Environment', true, [
                       _buildMaterialItem(context, Icons.videocam_outlined, 'Setup Flutter SDK', 'Video'),
                       _buildMaterialItem(context, Icons.picture_as_pdf_outlined, 'Instalasi Guide.pdf', 'Dokumen'),
                       _buildMaterialItem(context, Icons.quiz_outlined, 'Kuis Pra-Materi', 'Kuis'),
                    ]),
                    _buildWeeklyItem(context, '3', 'Dart Fundamentals', false, [
                       _buildMaterialItem(context, Icons.videocam_outlined, 'Dasar Pemrograman Dart', 'Video'),
                       _buildMaterialItem(context, Icons.code, 'Latihan Koding 1', 'Tugas'),
                    ]), 
                    _buildWeeklyItem(context, '4', 'Widget Basics', false, [
                       _buildMaterialItem(context, Icons.videocam_outlined, 'Stateless vs Stateful', 'Video'),
                       _buildMaterialItem(context, Icons.forum_outlined, 'Diskusi Widget', 'Forum'),
                    ]),
                    _buildWeeklyItem(context, '8', 'Ujian Tengah Semester (UTS)', false, [
                       _buildMaterialItem(context, Icons.timer_outlined, 'Soal UTS Pilihan Ganda', 'Kuis'),
                       _buildMaterialItem(context, Icons.upload_file, 'Project Submission', 'Tugas'),
                    ], isExam: true),
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
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: const Text('Lanjut Belajar'),
        ),
      ),
    );
  }

  Widget _buildWeeklyItem(BuildContext context, String week, String title, bool isCompleted, List<Widget> materials, {bool isExam = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: isExam ? Colors.orange.shade50 : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isExam ? Colors.orange.shade200 : Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          )
        ]
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: !isCompleted,
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: Container(
             padding: const EdgeInsets.all(10),
             decoration: BoxDecoration(
               color: isExam ? Colors.orange : AppColors.primary,
               shape: BoxShape.circle,
             ),
             child: Text(
               week,
               style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
             ),
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          trailing: isCompleted 
            ? const Icon(Icons.check_circle, color: Colors.green)
            : const Icon(Icons.expand_more),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                children: materials,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMaterialItem(BuildContext context, IconData icon, String title, String type) {
    Color iconColor;
    if (type == 'Video') iconColor = Colors.red;
    else if (type == 'Dokumen') iconColor = Colors.blue;
    else if (type == 'Kuis') iconColor = Colors.orange;
    else iconColor = AppColors.primary;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell( // Added InkWell
        onTap: () {
          if (type == 'Kuis') {
             Navigator.push(context, MaterialPageRoute(builder: (context) => const QuizPage()));
          } else if (type == 'Tugas') {
             Navigator.push(context, MaterialPageRoute(builder: (context) => const AssignmentPage()));
          }
        },
        borderRadius: BorderRadius.circular(8),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, size: 20, color: iconColor),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    type,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
