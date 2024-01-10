import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import './profile_page_screen.dart';

import './home_page_screen.dart';
import './friends_page_screen.dart';
import './notification_page_screen.dart';

// ignore: camel_case_types
class MainNavigator extends StatefulWidget {
  static const routeName = '/mainNavigator';
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

// ignore: camel_case_types
class _MainNavigatorState extends State<MainNavigator> {
  int _selectedIndex = 0;
  // ignore: prefer_final_fields
  List<Widget> _screens = [
    const HomePage(),
    const friendListScreen(),
    const notificationListScreen(),
    const profilePageScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: _screens[_selectedIndex],
        bottomNavigationBar: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 18.0,
            ),
            child: GNav(
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.grey.shade800,
              gap: 6,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              padding: const EdgeInsets.all(13),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.people_alt,
                  text: 'Friends',
                ),
                GButton(icon: Icons.notifications, text: 'Notifications'),
                GButton(
                  icon: Icons.person,
                  text: 'profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
