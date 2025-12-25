import 'package:celoe_lms/core/app_colors.dart';
import 'package:celoe_lms/features/home/presentation/widgets/course_card.dart';
import 'package:flutter/material.dart';

class CourseListPage extends StatelessWidget {
  const CourseListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Courses'),
          bottom: const TabBar(
            labelColor: AppColors.primary,
            unselectedLabelColor: Colors.grey,
            indicatorColor: AppColors.primary,
            tabs: [
              Tab(text: 'Ongoing'),
              Tab(text: 'Completed'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildCourseList(),
            _buildCourseList(isCompleted: true),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseList({bool isCompleted = false}) {
    if (isCompleted) {
       return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.history_edu, size: 64, color: Colors.grey[300]),
            const SizedBox(height: 16),
            Text(
              'No completed courses yet',
              style: TextStyle(color: Colors.grey[500]),
            ),
          ],
        ),
      );
    }
    
    return ListView.builder(
      padding: const EdgeInsets.all(16),
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
               height: 240, 
               child: CourseCard(
                title: 'Mobile App Development ${index + 1}',
                instructor: 'Dr. Rofi',
                progress: isCompleted ? 1.0 : 0.45,
                imageUrl: 'assets/images/image copy ${index % 4 == 0 ? "" : (index % 4) + 1}.png',
              ),
            ),
          ),
        );
      },
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
                      'About this course',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'This course covers the fundamentals of mobile application development using Flutter. You will learn how to build beautiful UI, manage state, and interact with APIs.',
                      style: TextStyle(color: Colors.grey, height: 1.5),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Modules',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    _buildModuleItem(context, '1', 'Introduction to Flutter', true),
                    _buildModuleItem(context, '2', 'Dart Basics', true),
                    _buildModuleItem(context, '3', 'Widget Tree & Layouts', false),
                    _buildModuleItem(context, '4', 'State Management', false),
                    _buildModuleItem(context, '5', 'API Integration', false),
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
          child: const Text('Continue Learning'),
        ),
      ),
    );
  }

  Widget _buildModuleItem(BuildContext context, String number, String title, bool isCompleted) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.1)),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isCompleted ? Colors.green.withValues(alpha: 0.1) : Colors.grey.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: isCompleted 
                  ? const Icon(Icons.check, color: Colors.green)
                  : Text(number, style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Icon(Icons.play_circle_outline, color: AppColors.primary),
        ],
      ),
    );
  }
}
