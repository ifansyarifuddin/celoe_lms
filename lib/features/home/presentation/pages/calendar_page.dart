import 'package:celoe_lms/core/app_colors.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jadwal Akademik'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildDaySection("Senin, 23 Des 2024", [
             _buildClassItem("08:00 - 10:00", "Pemrograman Mobile", "Ruang A301", "Dr. Rofi"),
             _buildClassItem("13:00 - 15:00", "Jaringan Komputer", "Lab Jarkom", "Budi Santoso"),
          ]),
          const SizedBox(height: 16),
          _buildDaySection("Selasa, 24 Des 2024", [
             _buildClassItem("10:00 - 12:00", "Basis Data", "Ruang B202", "Siti Aminah"),
          ]),
          const SizedBox(height: 16),
          _buildDaySection("Rabu, 25 Des 2024", [
             const Center(child: Padding(
               padding: EdgeInsets.all(16.0),
               child: Text("Tidak ada jadwal kuliah", style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic)),
             )),
          ]),
        ],
      ),
    );
  }

  Widget _buildDaySection(String date, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          date,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.primary),
        ),
        const SizedBox(height: 8),
        ...items,
      ],
    );
  }

  Widget _buildClassItem(String time, String subject, String location, String lecturer) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
      child: Row(
        children: [
          Column(
            children: [
              Text(time.split(' - ')[0], style: const TextStyle(fontWeight: FontWeight.bold)),
              Container(
                width: 2, height: 20, color: Colors.grey.shade300, margin: const EdgeInsets.symmetric(vertical: 4)
              ),
              Text(time.split(' - ')[1], style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(subject, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(location, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                    const SizedBox(width: 12),
                    const Icon(Icons.person_outline, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(lecturer, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
