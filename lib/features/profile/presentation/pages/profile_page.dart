import 'package:celoe_lms/core/app_colors.dart';
import 'package:celoe_lms/features/auth/presentation/pages/login_page.dart';
import 'package:celoe_lms/features/profile/presentation/pages/edit_profile_page.dart';
import 'package:celoe_lms/features/help/presentation/pages/help_page.dart';
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
              backgroundImage: AssetImage('assets/images/profile_pic.png'),
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
              'Student ID: 2022020100097',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 32),
            
            // Academic Info (Moved from Dashboard)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0,2)),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                   _buildStat('3.85', 'IPK'),
                   _buildStat('124', 'SKS'),
                   _buildStat('7', 'Semester'),
                ],
              ),
            ),

            const SizedBox(height: 32),
            _buildProfileItem(context, 'Edit Profile', Icons.edit_outlined),
            
            // Settings Toggle
            SwitchListTile(
              title: const Text('Dark Mode', style: TextStyle(fontWeight: FontWeight.w500)),
              secondary: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.dark_mode_outlined, color: Colors.purple),
              ),
              value: false, 
              onChanged: (val) {},
            ),

            _buildProfileItem(context, 'Notifications', Icons.notifications_none),
            _buildProfileItem(context, 'Help Center', Icons.help_outline),
            const SizedBox(height: 24),
            _buildLogoutButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: AppColors.primary)),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
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
            color: AppColors.primary.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.primary),
        ),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: () {
          if (title == 'Edit Profile') {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfilePage()));
          } else if (title == 'Help Center') {
             Navigator.push(context, MaterialPageRoute(builder: (context) => const HelpPage()));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$title tapped')));
          }
        },
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
