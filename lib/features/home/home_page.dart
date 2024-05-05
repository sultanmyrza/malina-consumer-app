import 'package:flutter/material.dart';
import 'package:malina_consumer_app/features/home/home_tab/cart/sub_carts/goods_cart/goods_cart_page.dart';
import 'package:malina_consumer_app/features/home/home_tab/home/home_page.dart';
import 'package:malina_consumer_app/features/home/widget/custom_overlay_bottom_sheet.dart';

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
      if (index != 4) {
        _indexedStackIndex = index;
        _bottomNavBarIndex = index;
        _bottomNavCartItemExpanded = false;
      } else if (_bottomNavBarIndex != 4) {
        _bottomNavBarIndex = index;
        _bottomNavCartItemExpanded = true;
      } else {
        _bottomNavCartItemExpanded = !_bottomNavCartItemExpanded;
      }
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
            child: Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: Container(
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x33000000),
                      blurRadius: 30,
                      offset: Offset(15, 0),
                      spreadRadius: 0,
                    )
                  ],
                ),
                height: 70,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: BottomNavigationBar(
                    backgroundColor: Colors.white,
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
                    type: BottomNavigationBarType.fixed,
                  ),
                ),
              ),
            ),
          ),
          CustomOverlayBottomSheet(
            isExpanded: _bottomNavCartItemExpanded,
            onSelect: (value) {
              setState(() {
                _selectedSubCart = value;
                _indexedStackIndex = _bottomNavBarIndex;
                _bottomNavCartItemExpanded = false;
              });
            },
            onDismiss: () => {
              setState(() {
                _bottomNavCartItemExpanded = false;
                _bottomNavBarIndex = _indexedStackIndex;
              }),
            },
          )
        ],
      ),
    );
  }
}
