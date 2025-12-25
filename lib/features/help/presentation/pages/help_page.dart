import 'package:celoe_lms/core/app_colors.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Center'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Frequently Asked Questions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildExpansionTile(
              'Cannot Login?',
              'Make sure you are using your Telkom University SSO credentials. If problems persist, contact IT Support.',
            ),
            _buildExpansionTile(
              'Forgot Password?',
              'You can reset your password via the SSO portal or contact the Helpdesk.',
            ),
            _buildExpansionTile(
              'Course not appearing?',
              'Courses are automatically synchronized. Try pulling down to refresh the Dashboard.',
            ),
            const SizedBox(height: 32),
            const Text(
              'Contact Support',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.whatsapp, color: Colors.green),
              ),
              title: const Text('WhatsApp Helpdesk'),
              subtitle: const Text('+62 811-1234-5678'),
              onTap: () {},
            ),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.email, color: Colors.blue),
              ),
              title: const Text('Email Support'),
              subtitle: const Text('helpdesk@telkomuniversity.ac.id'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpansionTile(String title, String content) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.withValues(alpha: 0.2)),
      ),
      child: ExpansionTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              content,
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
        ],
      ),
    );
  }
}
