import 'package:flutter/material.dart';
import 'AccountManagement/View/home.dart';
import '../src/Attendance/View/attendance.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigation();
}

class _BottomNavigation extends State<BottomNavigation> {
  int _selectedIndex = 0;

  final screens = [
    Home(),
    Attendance(),
    Home(),
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        body: screens[_selectedIndex],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              labelTextStyle: MaterialStateProperty.all(
            TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          )),
          child: NavigationBar(
            height: 60,
            selectedIndex: _selectedIndex,
            onDestinationSelected: (_selectedIndex) =>
                setState(() => this._selectedIndex = _selectedIndex),
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.library_add_check_outlined),
                label: 'Attendance',
              ),
              NavigationDestination(
                icon: Icon(Icons.account_circle),
                label: 'Account',
              ),
            ],
          ),
        ),
      );
}
