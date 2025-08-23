import 'package:flutter/material.dart';
import 'package:talent_sync/screens/home/jobs_screen.dart';
import 'package:talent_sync/screens/home/resume_screen.dart';

import '../profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Screens for navigation
  final List<Widget> _screens = const [
    JobsScreen(),
    ResumeScreen(),
    ProfileScreen(),
  ];

  // Titles for AppBar
  final List<String> _titles = [
    "Welcome to Talent Sync",
    "Resume Screening",
    "Profile",
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex],
            style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo,

      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: "Jobs",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: "Resume",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
