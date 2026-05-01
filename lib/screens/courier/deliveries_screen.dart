import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:loop_lojistik/theme/app_theme.dart';
import 'delivery_detail_screen.dart';

class CourierDeliveriesScreen extends StatelessWidget {
  const CourierDeliveriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _buildDeliveryCard(
                context,
                id: 'LP2412251',
                customer: 'Ahmet Yılmaz',
                address: 'Bağdat Cad. No:124 D:5, Kadıköy, İstanbul',
                time: '8 dk',
                distance: '1.2 km',
                price: 245.50,
                earning: 57.50,
                status: 'Yolda',
              ),
              const SizedBox(height: 16),
              _buildDeliveryCard(
                context,
                id: 'LP2412252',
                customer: 'Mehmet Demir',
                address: 'Şair Nedim Cad. No:45, Beşiktaş, İstanbul',
                time: '15 dk',
                distance: '2.8 km',
                price: 156.00,
                earning: 45.00,
                status: 'Hazırlanıyor',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.only(top: 64, left: 24, right: 24, bottom: 24),
      decoration: const BoxDecoration(
        color: AppTheme.primaryRed,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Teslimatlar',
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w900),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text('8 Aktif', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(LucideIcons.zap, size: 14, color: Colors.white70),
            label: const Text('Rotayı Optimize Et', style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold)),
            style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero),
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryCard(
    BuildContext context, {
    required String id,
    required String customer,
    required String address,
    required String time,
    required String distance,
    required double price,
    required double earning,
    required String status,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DeliveryDetailScreen(deliveryId: id)),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: Colors.grey[200]!),
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
                Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppTheme.primaryRed.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(LucideIcons.truck, color: AppTheme.primaryRed, size: 24),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('#$id', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        Text(customer, style: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: status == 'Yolda' ? Colors.blue[50] : Colors.amber[50],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    status.toUpperCase(),
                    style: TextStyle(
                      color: status == 'Yolda' ? Colors.blue[600] : Colors.amber[600],
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(LucideIcons.mapPin, size: 16, color: AppTheme.primaryRed),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    address,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF475569)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildStatItem(LucideIcons.clock, time),
                const SizedBox(width: 16),
                _buildStatItem(LucideIcons.navigation, distance),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('1 Ürün', style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Text('${price.toStringAsFixed(2)} ₺', style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 14)),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(LucideIcons.wallet, size: 12, color: Colors.green),
                          const SizedBox(width: 4),
                          Text('${earning.toStringAsFixed(2)} ₺', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.w900, fontSize: 12)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 14, color: Colors.grey[400]),
        const SizedBox(width: 4),
        Text(text.toUpperCase(), style: TextStyle(color: Colors.grey[400], fontSize: 11, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
