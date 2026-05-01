import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../theme/app_theme.dart';

class CustomBottomNav extends StatelessWidget {
  final bool isCustomer;
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    super.key,
    required this.isCustomer,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: isCustomer ? _buildCustomerItems() : _buildCourierItems(),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildCustomerItems() {
    return [
      _navItem(0, LucideIcons.package, 'Siparişler'),
      _navItem(1, LucideIcons.plusCircle, 'Yeni'),
      _navItem(2, LucideIcons.user, 'Profil'),
    ];
  }

  List<Widget> _buildCourierItems() {
    return [
      _navItem(0, LucideIcons.truck, 'Teslimat'),
      _navItem(1, LucideIcons.history, 'Geçmiş'),
      _navItem(2, LucideIcons.wallet, 'Kazanç'),
      _navItem(3, LucideIcons.user, 'Profil'),
    ];
  }

  Widget _navItem(int index, IconData icon, String label) {
    final isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryRed.withValues(alpha: 0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? AppTheme.primaryRed : Colors.grey,
              size: 20,
            ),
            if (isSelected) ...[
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppTheme.primaryRed,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
