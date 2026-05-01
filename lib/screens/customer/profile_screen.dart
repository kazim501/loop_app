import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';

class CustomerProfileScreen extends StatelessWidget {
  const CustomerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profilim')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: AppTheme.primaryRed,
              child: Icon(Icons.person, size: 40, color: Colors.white),
            ),
            const SizedBox(height: 16),
            const Text('Ahmet Yılmaz', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Text('ahmet.yilmaz@email.com', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 32),
            _buildItem(context, LucideIcons.user, 'Kişisel Bilgiler', '/personal-info'),
            _buildItem(context, LucideIcons.lock, 'Şifre Değiştir', '/change-password'),
            _buildItem(context, LucideIcons.creditCard, 'Ödeme Yöntemleri', null),
            _buildItem(context, LucideIcons.bell, 'Bildirimler', null),
            _buildItem(context, LucideIcons.logOut, 'Çıkış Yap', '/'),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, IconData icon, String title, String? route) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.primaryRed),
      title: Text(title),
      trailing: const Icon(LucideIcons.chevronRight, size: 18),
      onTap: () {
        if (route == '/') {
          Navigator.pushReplacementNamed(context, route!);
        } else if (route != null) {
          Navigator.pushNamed(context, route);
        }
      },
    );
  }
}
