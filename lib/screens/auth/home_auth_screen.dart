import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';

class HomeAuthScreen extends StatelessWidget {
  const HomeAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(24),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(LucideIcons.package, size: 80, color: AppTheme.primaryRed),
            const SizedBox(height: 24),
            const Text(
              'LOOP',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                color: AppTheme.primaryRed,
                letterSpacing: 2,
              ),
            ),
            const Text(
              'Hızlı ve Güvenli Lojistik',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 100),
            _buildRoleButton(
              context,
              title: 'Müşteri Girişi',
              icon: LucideIcons.user,
              subtitle: 'Paket göndermek istiyorum',
              onTap: () => Navigator.pushNamed(context, '/login-customer'),
            ),
            const SizedBox(height: 16),
            _buildRoleButton(
              context,
              title: 'Kurye Girişi',
              icon: LucideIcons.truck,
              subtitle: 'Teslimat yapmak istiyorum',
              onTap: () => Navigator.pushNamed(context, '/login-courier'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleButton(BuildContext context,
      {required String title,
      required String subtitle,
      required IconData icon,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.primaryRed.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: AppTheme.primaryRed),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
                  Text(subtitle,
                      style: const TextStyle(color: Colors.grey, fontSize: 14)),
                ],
              ),
            ),
            const Icon(LucideIcons.chevronRight, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
