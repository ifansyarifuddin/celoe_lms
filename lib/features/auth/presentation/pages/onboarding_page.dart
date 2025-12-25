import 'package:celoe_lms/core/app_colors.dart';
import 'package:celoe_lms/features/auth/presentation/pages/sign_up_page.dart';
import 'package:celoe_lms/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _slides = [
    {
      'title': 'Akses Materi Mudah',
      'description': 'Akses materi perkuliahan kapan saja dan di mana saja dengan mudah.',
      'icon': 'book', 
    },
    {
      'title': 'Komunitas Mahasiswa',
      'description': 'Berinteraksi dengan sesama mahasiswa dan dosen dalam komunitas UIM.',
      'icon': 'group',
    },
    {
      'title': 'Real-time Notification',
      'description': 'Dapatkan notifikasi tugas, ujian, dan pengumuman penting secara instan.',
      'icon': 'notifications',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _slides.length,
                itemBuilder: (context, index) {
                  return _buildSlide(_slides[index]);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _slides.length,
                (index) => Container(
                  margin: const EdgeInsets.all(4),
                  width: _currentPage == index ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? AppColors.primary
                        : AppColors.grey.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  if (_currentPage != _slides.length - 1)
                  TextButton(
                    onPressed: () {
                      _pageController.jumpToPage(_slides.length - 1);
                    },
                    child: const Text('Lewati'),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      if (_currentPage < _slides.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const SignUpPage()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    ),
                    child: Text(_currentPage == _slides.length - 1 ? 'Mulai' : 'Lanjut'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
             if (_currentPage == _slides.length - 1)
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Sudah punya akun? "),
                    GestureDetector(
                      onTap: () {
                         Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                        );
                      },
                      child: const Text(
                        "Masuk",
                        style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget _buildSlide(Map<String, String> slide) {
    IconData iconData;
    switch (slide['icon']) {
      case 'book':
        iconData = Icons.menu_book_rounded;
        break;
      case 'group':
        iconData = Icons.groups_rounded;
        break;
      case 'notifications':
        iconData = Icons.notifications_active_rounded;
        break;
      default:
        iconData = Icons.circle;
    }

    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: AppColors.secondary.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(iconData, size: 100, color: AppColors.primary),
          ),
          const SizedBox(height: 48),
          Text(
            slide['title']!,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            slide['description']!,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
