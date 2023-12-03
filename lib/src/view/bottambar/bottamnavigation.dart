// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:user_signin/core/colors.dart';
import 'package:user_signin/src/view/dashboard/home_screen.dart';
import 'package:user_signin/src/view/order/order_screen.dart';
import 'package:user_signin/src/view/profile/profile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const DashboardScreen(),
    const OrderScreen(),
     ProfileScreen()
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: redd,
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: white,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard, color: white),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: white),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
