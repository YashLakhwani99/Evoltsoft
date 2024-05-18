import 'package:evoltsoft/screens/charging_station.dart';
import 'package:evoltsoft/screens/notification_page.dart';
import 'package:evoltsoft/screens/payments_page.dart';
import 'package:evoltsoft/screens/profile_page.dart';
import 'package:evoltsoft/screens/scan_page.dart';

import 'package:evoltsoft/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color _color = const Color.fromRGBO(24, 63, 213, 1);
  int _selectedIndex = 0;
  final _screens = [
    const ChargingStationList(),
    const PaymentPage(),
    const ScanPage(),
    const NotificationPage(),
    ProfilePage(
      uid: AuthService().getCurrentUser()!.uid,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: SingleChildScrollView(
          child: Container(
            height: 100,
            color: Colors.white,
            child: BottomNavigationBar(
              iconSize: 30,
              backgroundColor: Colors.white,
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              selectedItemColor: _color,
              unselectedItemColor: Colors.grey,
              selectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.normal,
              ),
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.map),
                    label: 'Explore',
                    backgroundColor: Colors.white),
                BottomNavigationBarItem(
                  icon: Icon(Icons.payment),
                  label: 'Payments',
                  backgroundColor: Colors.white,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.qr_code_scanner_rounded),
                  label: 'Scan',
                  backgroundColor: Colors.white,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  label: 'Notifications',
                  backgroundColor: Colors.white,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                  backgroundColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
        body: _screens[_selectedIndex]);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
