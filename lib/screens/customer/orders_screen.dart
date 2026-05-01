import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';

class CustomerOrdersScreen extends StatelessWidget {
  const CustomerOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Siparişlerim'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Aktif'),
              Tab(text: 'Geçmiş'),
            ],
            indicatorColor: AppTheme.primaryRed,
            labelColor: AppTheme.primaryRed,
            labelStyle: TextStyle(fontWeight: FontWeight.w900),
          ),
        ),
        body: const TabBarView(
          children: [
            _OrdersList(isActive: true),
            _OrdersList(isActive: false),
          ],
        ),
      ),
    );
  }
}

class _OrdersList extends StatelessWidget {
  final bool isActive;
  const _OrdersList({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: isActive ? 2 : 5,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: ListTile(
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: (isActive ? Colors.orange : Colors.green).withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isActive ? LucideIcons.clock : LucideIcons.checkCircle,
                color: isActive ? Colors.orange : Colors.green,
                size: 20,
              ),
            ),
            title: Text('Sipariş #LOOP-${10230 + index}', style: const TextStyle(fontWeight: FontWeight.w900)),
            subtitle: Text(isActive ? 'Kurye Yolda' : 'Teslim Edildi'),
            trailing: const Icon(LucideIcons.chevronRight, size: 18),
            onTap: () {},
          ),
        );
      },
    );
  }
}
