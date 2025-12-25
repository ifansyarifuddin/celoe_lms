import 'package:celoe_lms/core/app_colors.dart';
import 'package:celoe_lms/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _agreeToTerms = false;
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pendaftaran'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Buat Akun Baru',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Silakan isi data diri Anda untuk mendaftar',
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            _buildTextField(label: 'Nama Lengkap', icon: Icons.person_outline),
            const SizedBox(height: 16),
            _buildTextField(label: 'NPM (Nomor Pokok Mahasiswa)', icon: Icons.badge_outlined, keyboardType: TextInputType.number),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Program Studi',
                prefixIcon: Icon(Icons.school_outlined),
              ),
              items: const [
                DropdownMenuItem(value: 'IF', child: Text('Teknik Informatika')),
                DropdownMenuItem(value: 'SI', child: Text('Sistem Informasi')),
                DropdownMenuItem(value: 'AG', child: Text('Agroteknologi')),
              ],
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            _buildTextField(label: 'Email', icon: Icons.email_outlined, keyboardType: TextInputType.emailAddress),
            const SizedBox(height: 16),
            TextFormField(
              obscureText: _isObscure,
              decoration: InputDecoration(
                labelText: 'Kata Sandi',
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  icon: Icon(_isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Checkbox(
                  value: _agreeToTerms,
                  activeColor: AppColors.primary,
                  onChanged: (value) {
                    setState(() {
                      _agreeToTerms = value ?? false;
                    });
                  },
                ),
                Expanded(
                  child: Text(
                    'Saya menyetujui syarat dan ketentuan Universitas Islam Madura',
                    style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _agreeToTerms
                  ? () {
                      // Navigate to Login after success
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Pendaftaran Berhasil! Silakan Login.')),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    }
                  : null,
              child: const Text('Daftar Sekarang'),
            ),
            const SizedBox(height: 24),
             Row(
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
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
      ),
    );
  }
}
