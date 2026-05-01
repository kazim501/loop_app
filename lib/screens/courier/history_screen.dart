import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:loop_lojistik/theme/app_theme.dart';

class CourierHistoryScreen extends StatelessWidget {
  const CourierHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final history = [
      { 'id': 'LP9901', 'date': '11 Mart 2026', 'customer': 'Ayşe Kaya', 'address': 'Nişantaşı, İstanbul', 'price': '₺120.00', 'earning': '₺45.00' },
      { 'id': 'LP9902', 'date': '10 Mart 2026', 'customer': 'Caner Öz', 'address': 'Etiler, İstanbul', 'price': '₺245.00', 'earning': '₺65.00' },
      { 'id': 'LP9903', 'date': '09 Mart 2026', 'customer': 'Selin Ak', 'address': 'Kadıköy, İstanbul', 'price': '₺85.00', 'earning': '₺35.00' },
      { 'id': 'LP9904', 'date': '08 Mart 2026', 'customer': 'Burak Yılmaz', 'address': 'Şişli, İstanbul', 'price': '₺310.00', 'earning': '₺80.00' },
    ];

    return Scaffold(
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(24),
              itemCount: history.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final item = history[index];
                return _buildHistoryCard(item);
              },
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
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(LucideIcons.arrowLeft, color: Colors.white),
          ),
          const SizedBox(width: 8),
          const Text(
            'Teslimat Geçmişi',
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryCard(Map<String, String> item) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(color: AppTheme.primaryRed.withValues(alpha: 0.05), borderRadius: BorderRadius.circular(12)),
                child: Text('#${item['id']}', style: const TextStyle(color: AppTheme.primaryRed, fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 1)),
              ),
              Text(item['date']!, style: const TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(color: Colors.grey[50], borderRadius: BorderRadius.circular(16)),
                child: const Icon(LucideIcons.user, color: Colors.grey, size: 24),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item['customer']!, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 14)),
                  Text(item['address']!.toUpperCase(), style: const TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 1)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('SİPARİŞ TUTARI', style: TextStyle(fontSize: 8, fontWeight: FontWeight.w900, color: Colors.grey, letterSpacing: 1)),
                  Text(item['price']!, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 14)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('KAZANCINIZ', style: TextStyle(fontSize: 8, fontWeight: FontWeight.w900, color: Colors.grey, letterSpacing: 1)),
                  Text(item['earning']!, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 14, color: Colors.green)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
