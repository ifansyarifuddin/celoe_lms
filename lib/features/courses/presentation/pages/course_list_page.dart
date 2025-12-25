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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kursus Saya'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.primary,
          unselectedLabelColor: Colors.grey,
          indicatorColor: AppColors.primary,
          tabs: const [
            Tab(text: 'Kursus Aktif'),
            Tab(text: 'Riwayat Selesai'),
          ],
        ),
      ),
      body: Column(
        children: [
           // Search & Filter
           Padding(
             padding: const EdgeInsets.all(16.0),
             child: TextField(
               controller: _searchController,
               decoration: InputDecoration(
                 hintText: 'Cari kursus...',
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
            child: _filteredCourses.isEmpty 
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.search_off, size: 64, color: Colors.grey[300]),
                      const SizedBox(height: 16),
                      Text(
                        'Tidak ada kursus ditemukan', 
                        style: TextStyle(color: Colors.grey[500])
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  itemCount: _filteredCourses.length,
                  itemBuilder: (context, index) {
                    final course = _filteredCourses[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: GestureDetector(
                        onTap: () {
                           Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => CourseDetailPage(courseTitle: course['title']))
                          );
                        },
                        child: SizedBox(
                           height: 250, 
                           child: CourseCard(
                            code: course['code'],
                            title: course['title'],
                            instructor: course['instructor'],
                            progress: course['progress'],
                            imageUrl: course['image'],
                          ),
                        ),
                      ),
                    );
                  },
                ),
          ),
        ],
      ),
    );
  }
}

// End of file
