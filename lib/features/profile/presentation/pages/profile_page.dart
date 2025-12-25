import 'package:celoe_lms/core/app_colors.dart';
import 'package:celoe_lms/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            const CircleAvatar(
              radius: 50,
              backgroundColor: AppColors.secondary,
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=12'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Ifan Syarifuddin', // Placeholder name
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Student ID: 1202190001',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 32),
            _buildProfileItem(context, 'Edit Profile', Icons.edit_outlined),
            _buildProfileItem(context, 'Settings', Icons.settings_outlined),
            _buildProfileItem(context, 'Help Center', Icons.help_outline),
            const SizedBox(height: 24),
            _buildLogoutButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(BuildContext context, String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        tileColor: Colors.white,
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.primary),
        ),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: () {},
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.red,
          elevation: 0,
          side: const BorderSide(color: Colors.red),
        ),
        onPressed: () {
          // Navigate back to Login
          Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginPage()),
            (route) => false,
          );
        },
        child: const Text('Log Out'),
      ),
    );
  }
}
