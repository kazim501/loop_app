import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:loop_lojistik/theme/app_theme.dart';

class DeliveryDetailScreen extends StatelessWidget {
  final String deliveryId;
  const DeliveryDetailScreen({super.key, required this.deliveryId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  _buildMapPreview(),
                  const SizedBox(height: 16),
                  _buildCustomerCard(),
                  const SizedBox(height: 16),
                  _buildDeliveryActions(),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 64, left: 16, right: 24, bottom: 48),
      decoration: const BoxDecoration(
        color: AppTheme.primaryRed,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(LucideIcons.arrowLeft, color: Colors.white),
            ),
          ),
          const Text(
            'Sipariş Detayı',
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }

  Widget _buildMapPreview() {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        image: const DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1524231757912-21f4fe3a7200?q=80&w=1000&auto=format&fit=crop'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: Colors.black.withValues(alpha: 0.1))),
          Positioned(
            left: 24,
            bottom: 24,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  Icon(LucideIcons.navigation, color: AppTheme.primaryRed, size: 16),
                  SizedBox(width: 8),
                  Text('1.2 km • 8 dk', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 12)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerCard() {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(color: Colors.grey[50], borderRadius: BorderRadius.circular(20)),
                    child: const Icon(LucideIcons.user, color: Colors.grey, size: 28),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Ahmet Yılmaz', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
                      Text('#$deliveryId', style: const TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 1)),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(color: Colors.green[50], borderRadius: BorderRadius.circular(20)),
                child: const Text('ÖDENDİ', style: TextStyle(color: Colors.green, fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 1)),
              ),
            ],
          ),
          const SizedBox(height: 32),
          _buildInfoItem(LucideIcons.mapPin, 'Teslimat Adresi', 'Bağdat Cad. No:124 D:5, Kadıköy, İstanbul'),
          const SizedBox(height: 24),
          _buildInfoItem(LucideIcons.phone, 'Telefon', '0532 123 45 67'),
          const SizedBox(height: 32),
          const Divider(),
          const SizedBox(height: 24),
          const Text('SİPARİŞ İÇERİĞİ', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: Colors.grey, letterSpacing: 1)),
          const SizedBox(height: 16),
          _buildOrderItem('Süt 1L', 2),
          const SizedBox(height: 12),
          _buildOrderItem('Tam Buğday Ekmeği', 1),
          const SizedBox(height: 32),
          const Divider(),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('TOPLAM TUTAR', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: Colors.grey, letterSpacing: 1)),
                  Text('₺156,00', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('KAZANCINIZ', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: Colors.grey, letterSpacing: 1)),
                  Text('₺57,50', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: Colors.green[700])),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(color: AppTheme.primaryRed.withValues(alpha: 0.05), borderRadius: BorderRadius.circular(12)),
          child: Icon(icon, color: AppTheme.primaryRed, size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label.toUpperCase(), style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: Colors.grey, letterSpacing: 1)),
              Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF334155))),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOrderItem(String name, int qty) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.grey[50], borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Text('x$qty', style: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w900)),
        ],
      ),
    );
  }

  Widget _buildDeliveryActions() {
    return Row(
      children: [
        Expanded(child: _buildActionBtn(LucideIcons.phone, 'ARA', Colors.black, Colors.white)),
        const SizedBox(width: 16),
        Expanded(child: _buildActionBtn(LucideIcons.checkCircle2, 'TESLİM ET', AppTheme.primaryRed, Colors.white)),
      ],
    );
  }

  Widget _buildActionBtn(IconData icon, String label, Color bg, Color text) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: bg,
        foregroundColor: text,
        padding: const EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 18),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 14)),
        ],
      ),
    );
  }
}
