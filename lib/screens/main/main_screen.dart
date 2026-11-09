
import 'package:flutter/material.dart';

import 'package:ticketing_app/core/constants.dart';
import 'package:ticketing_app/screens/home/home_page.dart';
import 'package:ticketing_app/screens/explore/explore_page.dart';
import 'package:ticketing_app/screens/tickets/tickets_page.dart';
import 'package:ticketing_app/screens/profile/profile_page.dart';
import 'package:ticketing_app/widgets/glass_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    ExplorePage(),
    TicketsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: IndexedStack(
              index: _currentIndex,
              children: _pages,
            ),
          ),
          Positioned(
            left: 22,
            right: 22,
            bottom: 18,
            child: GlassNavBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
