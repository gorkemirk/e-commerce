import 'package:ecommerce/feature/bag/bag.dart';
import 'package:ecommerce/feature/favorites/favorites.dart';
import 'package:ecommerce/feature/home/home.dart';
import 'package:ecommerce/feature/profile/profile.dart';
import 'package:ecommerce/feature/shop/shop.dart';
import 'package:flutter/material.dart';

class BottomNavBarItems {
  static List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Shop'),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Bag'),
    BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ];

  static List<Widget> pages = const [
    HomePage(),
    ShopPage(),
    BagPage(),
    FavoritesPage(),
    ProfilePage(),
  ];
}
