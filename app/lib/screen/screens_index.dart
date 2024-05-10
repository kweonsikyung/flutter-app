import 'package:app/src/colors.dart';
import 'package:flutter/material.dart';
import 'package:app/main.dart';
import 'package:app/screen/screens_Main.dart';
import 'package:app/screen/screens_account.dart';
import 'package:app/screen/screens_feed.dart';

class IndexScreen extends StatefulWidget {
  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          FeedScreen(),
          MainScreen(),
          AccountScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: '피드',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '계정',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ColorSystem.Secondary,
        onTap: _onItemTapped,
      ),
    );
  }
}
