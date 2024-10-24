import 'package:flutter/material.dart';
import 'package:trip_parallax/screens/home_screen/home_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 233, 216, 1),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromRGBO(117, 97, 83, 1),
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.confirmation_num_outlined), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month_outlined), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: ""),
          ]),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          HomeScreen(),
          Center(
            child: Text('Ticket Screen'),
          ),
          Center(
            child: Text('Calendar Screen'),
          ),
          Center(
            child: Text('Profile Screen'),
          ),
        ],
      ),
    );
  }
}
