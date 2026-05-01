import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:loop_lojistik/theme/app_theme.dart';
import '../shared/personal_info_screen.dart';
import 'history_screen.dart';

class CourierProfileScreen extends StatefulWidget {
  const CourierProfileScreen({super.key});

  @override
  State<CourierProfileScreen> createState() => _CourierProfileScreenState();
}

class _CourierProfileScreenState extends State<CourierProfileScreen> {
  bool isOnline = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        children: [
          _buildHeader(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                _buildProfileCard(context),
                const SizedBox(height: 24),
                _buildInfoSection(),
                const SizedBox(height: 24),
                _buildActionButtons(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 64, left: 24, right: 24, bottom: 80),
      decoration: const BoxDecoration(
        color: AppTheme.primaryRed,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
      ),
      child: const Text(
        'Profilim',
        style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w900),
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -40),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200]!.withValues(alpha: 0.5),
              blurRadius: 40,
              offset: const Offset(0, 20),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: 112,
              height: 112,
              decoration: BoxDecoration(
                color: AppTheme.primaryRed,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 4),
                boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 20)],
              ),
              child: const Center(child: Icon(LucideIcons.user, size: 48, color: Colors.white)),
            ),
            const SizedBox(height: 16),
            const Text('Ömer Demir', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
            const Text('Kurye #12345', style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 1)),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(LucideIcons.star, color: Colors.orange, size: 16),
                SizedBox(width: 4),
                Text('4.8', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14)),
              ],
            ),
            const SizedBox(height: 24),
            _buildStatusToggle(),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 24),
            _buildQuickStats(),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const PersonalInfoScreen()));
                },
                icon: const Icon(LucideIcons.edit2, size: 16),
                label: const Text('Profili Düzenle'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppTheme.primaryRed,
                  side: BorderSide(color: AppTheme.primaryRed.withValues(alpha: 0.2)),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusToggle() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isOnline ? const Color(0xFFECFDF5) : Colors.grey[50],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isOnline ? const Color(0xFFD1FAE5) : Colors.grey[100]!),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: isOnline ? Colors.white : Colors.grey[200], borderRadius: BorderRadius.circular(12)),
                child: Icon(LucideIcons.zap, color: isOnline ? Colors.green : Colors.grey, size: 20),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(isOnline ? 'Çevrimiçi' : 'Çevrimdışı', style: TextStyle(fontWeight: FontWeight.w900, color: isOnline ? Colors.green[800] : Colors.grey[600])),
                  Text(isOnline ? 'Yeni siparişler alınıyor' : 'Sipariş alımı kapalı', style: TextStyle(fontSize: 10, color: isOnline ? Colors.green[600] : Colors.grey[400])),
                ],
              ),
            ],
          ),
          Switch(
            value: isOnline,
            onChanged: (v) => setState(() => isOnline = v),
            activeColor: Colors.green,
            activeTrackColor: Colors.green[100],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickStats() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _stat('1.234', 'Teslimat'),
        _stat('98.5%', 'Başarı'),
        _stat('4.8', 'Puan'),
      ],
    );
  }

  static Widget _stat(String val, String label) {
    return Column(
      children: [
        Text(val, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: AppTheme.primaryRed)),
        Text(label.toUpperCase(), style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: Colors.grey, letterSpacing: 1)),
      ],
    );
  }

  Widget _buildInfoSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200]!.withValues(alpha: 0.5),
            blurRadius: 40,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Kurye Bilgileri', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
          const SizedBox(height: 24),
          _buildDetailItem(LucideIcons.mapPin, 'Çalışma Bölgesi', 'Kadıköy, İstanbul'),
          const SizedBox(height: 16),
          _buildDetailItem(LucideIcons.navigation, 'Araç Tipi', 'Motorsiklet'),
          const SizedBox(height: 16),
          _buildDetailItem(LucideIcons.wallet, 'Plaka', '34 ABC 123'),
        ],
      ),
    );
  }

  Widget _buildDetailItem(IconData icon, String label, String value) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(color: AppTheme.primaryRed.withValues(alpha: 0.05), borderRadius: BorderRadius.circular(12)),
          child: Icon(icon, color: AppTheme.primaryRed, size: 18),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label.toUpperCase(), style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: Colors.grey, letterSpacing: 1)),
            Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        _buildProfileMenuButton(LucideIcons.history, 'Teslimat Geçmişi', () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const CourierHistoryScreen()));
        }),
        const SizedBox(height: 12),
        _buildProfileMenuButton(LucideIcons.lock, 'Şifremi Değiştir', () {
          Navigator.pushNamed(context, '/change-password');
        }),
        const SizedBox(height: 12),
        _buildProfileMenuButton(LucideIcons.logOut, 'Çıkış Yap', () {
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        }),
      ],
    );
  }

  Widget _buildProfileMenuButton(IconData icon, String label, VoidCallback onTap) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, size: 18),
        label: Text(label),
        style: OutlinedButton.styleFrom(
          foregroundColor: AppTheme.primaryRed,
          side: BorderSide(color: AppTheme.primaryRed.withValues(alpha: 0.2)),
          padding: const EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        ),
      ),
    );
  }
}
