// ignore_for_file: camel_case_types

import 'package:chic_events/const.dart';
import 'package:chic_events/screens/cart.dart';
import 'package:chic_events/screens/home/presentation/home.dart';
import 'package:chic_events/screens/profile.dart';
import 'package:chic_events/screens/vendors/presentation/one.dart';
import 'package:flutter/material.dart';

class navbar extends StatefulWidget {
  const navbar({super.key});

  @override
  State<navbar> createState() => _navbarState();
}

class _navbarState extends State<navbar> {
  int currentpage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          setState(() {
            currentpage = value;
          });
        },
        indicatorColor: color3,
        selectedIndex: currentpage,
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.star),
            icon: Icon(Icons.star_outline),
            label: 'Vendors',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.shopping_cart),
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
        ],
      ),
      body: <Widget>[
        HomePage(),
        const One(),
        CartPage(),
        const Myprofile()
      ][currentpage],
    );
  }
}
