import 'package:flutter/material.dart';
import 'package:loop_lojistik/screens/auth/home_auth_screen.dart';
import 'package:loop_lojistik/screens/auth/login_screen.dart';
import 'package:loop_lojistik/screens/auth/register_screen.dart';
import 'package:loop_lojistik/screens/customer/orders_screen.dart';
import 'package:loop_lojistik/screens/customer/new_order_screen.dart';
import 'package:loop_lojistik/screens/customer/profile_screen.dart';
import 'package:loop_lojistik/screens/courier/deliveries_screen.dart';
import 'package:loop_lojistik/screens/courier/history_screen.dart';
import 'package:loop_lojistik/screens/courier/earnings_screen.dart';
import 'package:loop_lojistik/screens/courier/profile_screen.dart';
import 'package:loop_lojistik/screens/shared/personal_info_screen.dart';
import 'package:loop_lojistik/screens/shared/change_password_screen.dart';
import 'package:loop_lojistik/widgets/bottom_nav.dart';
import 'package:loop_lojistik/theme/app_theme.dart';

void main() {
  runApp(const LoopApp());
}

class LoopApp extends StatelessWidget {
  const LoopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loop',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeAuthScreen(),
        '/login-customer': (context) => const LoginScreen(isCustomer: true),
        '/login-courier': (context) => const LoginScreen(isCustomer: false),
        '/register': (context) => const RegisterScreen(),
        '/customer-home': (context) => const MainNavigation(isCustomer: true),
        '/courier-home': (context) => const MainNavigation(isCustomer: false),
        '/personal-info': (context) => const PersonalInfoScreen(),
        '/change-password': (context) => const ChangePasswordScreen(),
      },
    );
  }
}

class MainNavigation extends StatefulWidget {
  final bool isCustomer;
  const MainNavigation({super.key, required this.isCustomer});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> customerScreens = [
      const CustomerOrdersScreen(),
      const NewOrderScreen(),
      const CustomerProfileScreen(),
    ];

    final List<Widget> courierScreens = [
      const CourierDeliveriesScreen(),
      const CourierHistoryScreen(),
      const CourierEarningsScreen(),
      const CourierProfileScreen(),
    ];

    return Scaffold(
      body: widget.isCustomer 
          ? customerScreens[_selectedIndex] 
          : courierScreens[_selectedIndex],
      bottomNavigationBar: CustomBottomNav(
        isCustomer: widget.isCustomer,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}
