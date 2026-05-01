import 'package:flutter/material.dart';


class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kişisel Bilgiler')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const TextField(decoration: InputDecoration(labelText: 'Ad Soyad')),
            const SizedBox(height: 16),
            const TextField(decoration: InputDecoration(labelText: 'E-posta')),
            const SizedBox(height: 16),
            const TextField(decoration: InputDecoration(labelText: 'Telefon')),
            const SizedBox(height: 40),
            ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('KAYDET')),
          ],
        ),
      ),
    );
  }
}
