import 'package:celoe_lms/core/app_colors.dart';
import 'package:flutter/material.dart';

class MaterialViewerPage extends StatelessWidget {
  final String title;
  final String type;

  const MaterialViewerPage({super.key, required this.title, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              type == 'Video' ? Icons.play_circle_fill : Icons.picture_as_pdf,
              size: 80,
              color: Colors.white,
            ),
            const SizedBox(height: 16),
            Text(
              '$type Placeholder',
              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              type == 'Video' ? 'Video Player akan muncul di sini.' : 'Dokumen Viewer akan muncul di sini.',
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
