// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegetasi_app/page/about_page.dart';
import 'package:vegetasi_app/page/add_news_page.dart';
import 'package:vegetasi_app/page/guide_page.dart';
import 'package:vegetasi_app/page/home_page.dart';
import 'package:vegetasi_app/page/map_selection_page.dart';
import 'package:vegetasi_app/provider/count_data.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super. key});

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomePage(),
    const MapSelectionPage(), // Placeholder for search page
    const GuidePage(), // Placeholder for notifications page
    const AboutPage(), // Placeholder for profile page
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Column(
        children: [
          Expanded(child: _pages[_currentIndex]),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left:10,right: 10,bottom: 20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color(0xFFF6F6F6),          
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0,right: 16,top: 3,bottom: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildNavItem(Icons.home, 0),
              buildNavItem(Icons.map, 1),
              buildCenterNavItem(),
              buildNavItem(Icons.question_mark, 2),
              buildNavItem(Icons.person, 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNavItem(IconData icon, int index) {
    return IconButton(
      icon: Icon(
        icon,
        color: _currentIndex == index ? Colors.black : Colors.grey,size: 27,
      ),
      onPressed: () {
        _onItemTapped(index);
      },
    );
  }

  Widget buildCenterNavItem() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFF319F5F),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 5),
            blurRadius: 10,
          ),
        ],
      ),
      child: IconButton(
        icon: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () {
          context.read<CountDataProvider>().countData();
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddNewsPage()));          
        },
      ),
    );
  }
}
