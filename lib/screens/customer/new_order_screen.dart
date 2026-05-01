import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';


class NewOrderScreen extends StatelessWidget {
  const NewOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Yeni Gönderi')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Nereden Alınacak?', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
            const SizedBox(height: 12),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Alış Adresi girin',
                prefixIcon: Icon(LucideIcons.mapPin, size: 20),
              ),
            ),
            const SizedBox(height: 24),
            const Text('Nereye Gidecek?', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
            const SizedBox(height: 12),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Teslimat Adresi girin',
                prefixIcon: Icon(LucideIcons.truck, size: 20),
              ),
            ),
            const SizedBox(height: 24),
            const Text('Paket Detayları', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
            const SizedBox(height: 12),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Paket içeriği (örn: Dosya, Yemek vb.)',
                prefixIcon: Icon(LucideIcons.box, size: 20),
              ),
            ),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Sipariş başarıyla oluşturuldu!', style: TextStyle(fontWeight: FontWeight.bold)),
                    backgroundColor: Colors.green,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                );
              },
              child: const Text('SİPARİŞ OLUŞTUR'),
            ),
          ],
        ),
      ),
    );
  }
}
