import 'package:flutter/material.dart';

import 'add_product.dart';
import 'cart_screen.dart';
import 'main_screen.dart';
import 'setting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPage = 0;

  List<Widget> widgets = [
    const MainScreen(),
    const AddProduct(),
    // const CartScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: "Add",
            ),
            //  BottomNavigationBarItem(
            //   icon: Icon(Icons.shopping_cart),
            //   label: "Cart",
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_vert),
              label: "More",
            ),
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
