import 'package:celoe_lms/core/app_colors.dart';
import 'package:celoe_lms/features/home/presentation/widgets/course_card.dart';
import 'package:celoe_lms/features/courses/presentation/pages/course_detail_page.dart'; // Added
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

// End of file
