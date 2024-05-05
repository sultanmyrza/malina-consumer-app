import 'package:flutter/material.dart';
import 'package:malina_consumer_app/features/home/home_tab/cart/sub_carts/goods_cart/goods_cart_page.dart';
import 'package:malina_consumer_app/features/home/home_tab/home/home_page.dart';

import 'home_tab/favorites/favorites_page.dart';
import 'home_tab/feeds/feeds_page.dart';
import 'home_tab/profile/profile_page.dart';

// TOOO: @sultanmyrza move to relevant file.
enum CartPageSubCarts { foodsCart, goodsCart }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _indexedStackIndex = 2; // default index if you want to start at Home tab
  var _bottomNavBarIndex = 2;

  var _selectedSubCart = CartPageSubCarts.foodsCart;
  var _bottomNavCartItemExpanded = false;

  void onTabTapped(int index) {
    setState(() {
      // TODO: @sultanmyrza implement logic
      _indexedStackIndex = index;
      _bottomNavBarIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: _indexedStackIndex, // Current index
            children: [
              const FeedsPage(),
              const FavoritesPage(),
              const HomeTabPage(),
              const ProfilePage(),
              _selectedSubCart == CartPageSubCarts.foodsCart
                  ? const GoodsCartPage()
                  : const GoodsCartPage(),
            ], // List of pages
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: BottomNavigationBar(
              onTap: onTabTapped,
              currentIndex: _bottomNavBarIndex,
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
              type: BottomNavigationBarType
                  .fixed, // Ensures all items are visible
            ),
          ),
        ],
      ),
    );
  }
}
