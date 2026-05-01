import 'package:flutter/material.dart';


class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Şifre Değiştir')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const TextField(obscureText: true, decoration: InputDecoration(labelText: 'Mevcut Şifre')),
            const SizedBox(height: 16),
            const TextField(obscureText: true, decoration: InputDecoration(labelText: 'Yeni Şifre')),
            const SizedBox(height: 16),
            const TextField(obscureText: true, decoration: InputDecoration(labelText: 'Yeni Şifre Tekrar')),
            const SizedBox(height: 40),
            ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('ŞİFREYİ GÜNCELLE')),
          ],
        ),
      ),
    );
  }
}
