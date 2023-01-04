import 'package:flutter/material.dart';
import '../src/home.dart';
import '../src/Attendance/View/attendance.dart';
import 'AccountManagement/View/account.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({super.key, this.staffRole});

  String? staffRole;

  @override
  State<BottomNavigation> createState() => _BottomNavigation();
}

class _BottomNavigation extends State<BottomNavigation> {
  int _selectedIndex = 0;

  var screens ;

  @override
  Widget build(BuildContext context) {
    setState(() {
      screens = [
        Home(staffRole: widget.staffRole,),
        Attendance(),
        Account(),
      ];
    });

    return Scaffold(
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
}
