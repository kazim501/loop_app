import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';

class LoginScreen extends StatefulWidget {
  final bool isCustomer;
  const LoginScreen({super.key, required this.isCustomer});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.isCustomer ? 'Müşteri Girişi' : 'Kurye Girişi',
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: AppTheme.primaryRed),
            ),
            const SizedBox(height: 8),
            const Text('Hesabınıza erişmek için bilgilerinizi girin', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 40),
            const TextField(
              decoration: InputDecoration(
                labelText: 'E-posta',
                prefixIcon: Icon(LucideIcons.mail),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Şifre',
                prefixIcon: const Icon(LucideIcons.lock),
                suffixIcon: IconButton(
                  icon: Icon(_isPasswordVisible ? LucideIcons.eye : LucideIcons.eyeOff),
                  onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                if (widget.isCustomer) {
                  Navigator.pushReplacementNamed(context, '/customer-home');
                } else {
                  Navigator.pushReplacementNamed(context, '/courier-home');
                }
              },
              child: const Text('GİRİŞ YAP'),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Hesabınız yok mu?'),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/register'),
                  child: const Text('Kayıt Ol', style: TextStyle(fontWeight: FontWeight.w900, color: AppTheme.primaryRed)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
