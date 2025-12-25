import 'package:celoe_lms/core/app_colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class AssignmentPage extends StatefulWidget {
  const AssignmentPage({super.key});

  @override
  State<AssignmentPage> createState() => _AssignmentPageState();
}

class _AssignmentPageState extends State<AssignmentPage> {
  String? _selectedFileName;

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'png'],
    );

    if (result != null) {
      setState(() {
        _selectedFileName = result.files.single.name;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('File berhasil dipilih')),
      );
    } else {
      // User canceled the picker
    }
  }

  void _removeFile() {
    setState(() {
      _selectedFileName = null;
    });
  }

  void _submitAssignment() {
    if (_selectedFileName == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Harap upload file tugas terlebih dahulu!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Tugas berhasil dikumpulkan!'),
        backgroundColor: Colors.green,
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Tugas'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.red.shade100),
              ),
              child: Row(
                children: [
                  const Icon(Icons.timer_outlined, color: Colors.red),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Batas Waktu', style: TextStyle(color: Colors.red)),
                      Text(
                        'Senin, 30 Des 2025, 23:59 WIB',
                        style: TextStyle(
                          color: Colors.red.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
             const Text(
              'Tugas 1: Analisis UI/UX',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Buatlah analisis perbandingan antara aplikasi Gojek dan Grab dari sisi User Experience. \n\nKetentuan:\n1. Format PDF\n2. Minimal 5 halaman\n3. Sertakan screenshot',
              style: TextStyle(fontSize: 16, height: 1.5, color: Colors.black87),
            ),
            const SizedBox(height: 32),
            const Text(
              'File Tugas',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: _selectedFileName != null ? Colors.green : Colors.grey.shade300, 
                  style: BorderStyle.solid
                ),
                borderRadius: BorderRadius.circular(12),
                color: _selectedFileName != null ? Colors.green.shade50 : Colors.white,
              ),
              child: Column(
                children: [
                   Icon(
                     _selectedFileName != null ? Icons.check_circle_outline : Icons.cloud_upload_outlined, 
                     size: 48, 
                     color: _selectedFileName != null ? Colors.green : Colors.grey
                   ),
                   const SizedBox(height: 8),
                   Text(
                     _selectedFileName ?? 'Tap untuk upload file', 
                     style: TextStyle(
                       color: _selectedFileName != null ? Colors.green.shade800 : Colors.grey,
                       fontWeight: _selectedFileName != null ? FontWeight.bold : FontWeight.normal,
                     )
                   ),
                   const SizedBox(height: 16),
                   _selectedFileName != null 
                    ? OutlinedButton.icon(
                        onPressed: _removeFile,
                        icon: const Icon(Icons.delete, color: Colors.red),
                        label: const Text('Hapus File', style: TextStyle(color: Colors.red)),
                        style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.red)),
                      )
                    : OutlinedButton(
                        onPressed: _pickFile,
                        child: const Text('Pilih File'),
                      )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black12)],
        ),
        child: ElevatedButton(
          onPressed: _submitAssignment,
          style: ElevatedButton.styleFrom(
            backgroundColor: _selectedFileName != null ? AppColors.primary : Colors.grey,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: const Text('Kumpulkan Tugas', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
