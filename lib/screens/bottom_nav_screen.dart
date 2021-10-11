import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:http_app/providers/bottom_nav_provider.dart';
import 'package:http_app/screens/home_screen.dart';
import 'package:http_app/screens/setting_screen.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  static final tabs = [
    const HomeScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<BottomNavBarProvider>(context);
    return Scaffold(
      body: tabs[navProvider.currentIndex],
      bottomNavigationBar: SafeArea(
        child: CupertinoTabBar(
          currentIndex: navProvider.currentIndex,
          onTap: (index) {
            navProvider.currentIndex = index;
          },
          items: [
            _bottomNavigationBarItem(
              icon: Icons.home,
              label: 'Home',
            ),
            _bottomNavigationBarItem(
              icon: Icons.settings,
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }

  _bottomNavigationBarItem({required IconData icon, required String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
