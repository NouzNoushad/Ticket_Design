import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.airplane_ticket), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          ]),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          Center(
            child: Text('Home Screen'),
          ),
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
