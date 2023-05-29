import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../utils/helpers.dart';
import '../../firebase/fb_fire_store_controller.dart';
import '../../model/product.dart';
import '../widget/page_view_home.dart';
import 'add_product.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with Helpers {
  late PageController _pageController;
  int _cuurentpage = 0;
  int _selectedTabBar = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
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
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 0,
            ),
            SizedBox(
              height: 300,
              child: GridView.builder(
                padding: EdgeInsets.all(10),
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                        color: Color(0xFFF0F1F6),
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
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabPageSelectorIndicator(
                    backgroundColor: _selectedTabBar == 0
                        ? Color(0xFF474459)
                        : Color(0xFFD7D7D7),
                    borderColor: Color(0xFFD7D7D7),
                    size: 10),
                TabPageSelectorIndicator(
                    backgroundColor: _selectedTabBar == 1
                        ? Color(0xFF474459)
                        : Color(0xFFD7D7D7),
                    borderColor: Color(0xFFD7D7D7),
                    size: 10),
                TabPageSelectorIndicator(
                    backgroundColor: _selectedTabBar == 2
                        ? Color(0xFF474459)
                        : Color(0xFFD7D7D7),
                    borderColor: Color(0xFFD7D7D7),
                    size: 10),
              ],
            ),
            SizedBox(
              height: 32,
            ),
            StreamBuilder<QuerySnapshot<Product>>(
                stream: FbFireStoreController().read(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasData &&
                      snapshot.data!.docs.isNotEmpty) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 12, end: 12),
                        child: GridView.builder(
                            shrinkWrap: true,
                            // physics: NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.docs.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 13,
                              mainAxisSpacing: 13,
                              childAspectRatio: 100 / 160,
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 1),
                                    Image.asset(
                                      'asset/images/handBag_two.png',
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                          start: 20),
                                      child: Text(
                                        snapshot.data!.docs[index].data().title,
                                        style: const TextStyle(
                                          color: Color(0xff474559),
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                          start: 20, end: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            snapshot.data!.docs[index]
                                                .data()
                                                .price,
                                            style: const TextStyle(
                                              color: Color(0xff9E9DB0),
                                              fontSize: 15,
                                            ),
                                          ),
                                          const Spacer(),
                                          IconButton(
                                              onPressed: () async {
                                                _deleteProduct(snapshot
                                                    .data!.docs[index].id);
                                              },
                                              icon: const Icon(
                                                Icons.delete,
                                                color: Color(0xffDD2828),
                                              )),
                                          IconButton(
                                            onPressed: () async {
                                              navigateToUpdateNoteScreen(
                                                  snapshot, index);
                                            },
                                            icon: Image.asset(
                                                'asset/images/update.png'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text("NO DATA"),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }

  void navigateToUpdateNoteScreen(
      AsyncSnapshot<QuerySnapshot<Product>> snapshot, int index) {
    QueryDocumentSnapshot<Product> noteSnapshot = snapshot.data!.docs[index];
    Product product = noteSnapshot.data();
    product.id = noteSnapshot.id;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddProduct(
          product: product,
        ),
      ),
    );
  }

  Future<void> _deleteProduct(String id) async {
    bool deleted = await FbFireStoreController().delete(path: id);
    String message =
        deleted ? 'Note deleted successfully' : 'Note delete failed!';
    // ignore: use_build_context_synchronously
    showSnackBar(context, message: message, error: !deleted);
  }
}
