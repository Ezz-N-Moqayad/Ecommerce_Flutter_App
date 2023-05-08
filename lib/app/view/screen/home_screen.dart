import 'package:e_commerce_app/app/view/screen/cart_screen.dart';
import 'package:e_commerce_app/app/view/screen/setting_screen.dart';
import 'package:e_commerce_app/app/view/screen/main_screen.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPage = 0;

  List<Widget> widgets = [
    MainScreen(),
    CartScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home",),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.more_vert), label: "More"),
          ],
          elevation: 5,
          iconSize: 32,
          currentIndex: _selectedPage,
          onTap: (value) {
            setState(() {
              _selectedPage = value;
            });
          },
        ),
        body: widgets[_selectedPage],
      ),
    );
  }
}
