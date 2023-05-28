import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/product_controller.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool productFavoirt = false;
  int _selectedTabBar = 0;

  @override
  Widget build(BuildContext context) {
    final productController = Provider.of<ProductController>(context);

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          bottom: const TabBar(
            unselectedLabelStyle: TextStyle(
              color: Color(0xFF9E9DB0),
            ),
            tabs: [
              Tab(
                child: Text(
                  "Kinsa",
                  style: TextStyle(color: Color(0xFF474559)),
                ),
              ),
              Tab(
                child: Text(
                  "Womens",
                  style: TextStyle(color: Color(0xFF474559)),
                ),
              ),
              Tab(
                child: Text(
                  "Handbags",
                  style: TextStyle(color: Color(0xFF474559)),
                ),
              ),
              Tab(
                child: Text(
                  "Boots",
                  style: TextStyle(color: Color(0xFF474559)),
                ),
              ),
              Tab(
                child: Text(
                  "Mens",
                  style: TextStyle(color: Color(0xFF474559)),
                ),
              ),
            ],
            isScrollable: true,
          ),
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 300,
              child: GridView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 10,
                  childAspectRatio: 220 / 198,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _selectedTabBar = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F1F6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Image.asset("asset/images/handBag_three.png"),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabPageSelectorIndicator(
                    backgroundColor: _selectedTabBar == 0
                        ? const Color(0xFF474459)
                        : const Color(0xFFD7D7D7),
                    borderColor: const Color(0xFFD7D7D7),
                    size: 10),
                TabPageSelectorIndicator(
                    backgroundColor: _selectedTabBar == 1
                        ? const Color(0xFF474459)
                        : const Color(0xFFD7D7D7),
                    borderColor: const Color(0xFFD7D7D7),
                    size: 10),
                TabPageSelectorIndicator(
                    backgroundColor: _selectedTabBar == 2
                        ? const Color(0xFF474459)
                        : const Color(0xFFD7D7D7),
                    borderColor: const Color(0xFFD7D7D7),
                    size: 10),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            GridView.builder(
              shrinkWrap: true,
              itemCount: productController.products.length,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(10),
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                mainAxisExtent: 360,
              ),
              itemBuilder: (context, index) {
                final product = productController.products[index];

                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/product_detailes");
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Column(
                        children: [
                          Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: IconButton(
                              icon: const Icon(Icons.favorite),
                              onPressed: () {
                                setState(
                                  () {
                                    productFavoirt = !productFavoirt;
                                  },
                                );
                                print(productFavoirt);
                              },
                              color: productFavoirt
                                  ? Colors.red.shade500
                                  : Colors.grey.shade500,
                            ),
                          ),
                          Image.asset("asset/images/handBag_one.png"),
                          Text(product.name),
                          SizedBox(height: 12),
                          Text('\$${product.price}'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
