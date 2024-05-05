import 'package:flutter/material.dart';
import 'package:malina_consumer_app/features/home/home_tab/home/home_page.dart';

import 'home_tab/cart/cart_page.dart';
import 'home_tab/favorites/favorites_page.dart';
import 'home_tab/feeds/feeds_page.dart';
import 'home_tab/profile/profile_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 2; // default index if you want to start at Home tab

  // Using IndexedStack to keep state of non-visible pages
  final List<Widget> _pages = [
    FeedsPage(),
    FavoritesPage(),
    HomeTabPage(),
    ProfilePage(),
    CartPage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex, // Current index
        children: _pages, // List of pages
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Feeds',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
        type: BottomNavigationBarType.fixed, // Ensures all items are visible
      ),
    );
  }
}
