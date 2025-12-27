import 'package:celoe_lms/core/app_colors.dart';
import 'package:celoe_lms/features/home/presentation/widgets/course_card.dart';
import 'package:celoe_lms/features/courses/presentation/pages/course_detail_page.dart';
import 'package:flutter/material.dart';

class CourseListPage extends StatefulWidget {
  const CourseListPage({super.key});

  @override
  State<CourseListPage> createState() => _CourseListPageState();
}

class _CourseListPageState extends State<CourseListPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  
  // Mock Data for "Kursus" (Training Concept)
  final List<Map<String, dynamic>> _allCourses = [
    {
      'code': 'BATCH-12',
      'title': 'Flutter Masterclass 2024',
      'instructor': 'Expert: Budi Santoso',
      'progress': 0.45,
      'status': 'Aktif',
      'image': 'assets/images/1.png',
    },
    {
      'code': 'UIUX-05',
      'title': 'UI/UX Design Bootcamp',
      'instructor': 'Mentor: Rina A.',
      'progress': 0.10,
      'status': 'Aktif',
      'image': 'assets/images/2.png',
    },
    {
      'code': 'PY-DATA',
      'title': 'Python for Data Science',
      'instructor': 'Dr. Andi',
      'progress': 0.85,
      'status': 'Aktif',
      'image': 'assets/images/3.png',
    },
    {
      'code': 'MKT-101',
      'title': 'Digital Marketing Certification',
      'instructor': 'Google Certified Trainer',
      'progress': 1.0,
      'status': 'Selesai',
      'image': 'assets/images/4.png',
    },
    {
      'code': 'WEB-FULL',
      'title': 'Fullstack Web Laravel',
      'instructor': 'LaraCasts Team',
      'progress': 1.0,
      'status': 'Selesai',
      'image': 'assets/images/5.png',
    },
  ];

  List<Map<String, dynamic>> _filteredCourses = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _filteredCourses = _allCourses;
    _searchController.addListener(_onSearchChanged);
    _tabController.addListener(_onTabChanged); // Listen to tab changes
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _filterCourses();
    });
  }

  void _onTabChanged() {
    if (_tabController.indexIsChanging) return;
    setState(() {
      _filterCourses();
    });
  }

  void _filterCourses() {
    String query = _searchController.text.toLowerCase();
    String currentStatus = _tabController.index == 0 ? 'Aktif' : 'Selesai';

    _filteredCourses = _allCourses.where((course) {
      bool matchesQuery = course['title'].toLowerCase().contains(query) ||
                          course['instructor'].toLowerCase().contains(query);
      bool matchesStatus = course['status'] == currentStatus;
      
      return matchesQuery && matchesStatus;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
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
