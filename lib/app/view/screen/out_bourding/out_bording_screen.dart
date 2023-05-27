import 'package:e_commerce_app/app/storage/shared_prefrenses_controller.dart';
import 'package:e_commerce_app/app/view/widget/custom_bording_page.dart';
import 'package:e_commerce_app/app/view/widget/custom_page_indector.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OutBordingScreen extends StatefulWidget {
  const OutBordingScreen({Key? key}) : super(key: key);

  @override
  State<OutBordingScreen> createState() => _OutBordingScreenState();
}

class _OutBordingScreenState extends State<OutBordingScreen> {
  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int _pageSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  _pageController.animateToPage(2,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInBack);
                },
                child: Text("SKIP"),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: BouncingScrollPhysics(),
                onPageChanged: (value) {
                  setState(() {
                    _pageSelected = value;
                  });
                },
                children: [
                  CustomBordingPage(
                    image: "out_bording_one.png",
                    title: "Welcome!",
                    subTitle:
                        "Now were up in the big leagues gettingour turn at bat. The Brady Bunch that's the way we  Brady Bunch..",
                  ),
                  CustomBordingPage(
                    image: "out_bording_two.png",
                    title: "Add to cart",
                    subTitle:
                        "Now were up in the big leagues gettingour turn at bat. The Brady Bunch that's the way we  Brady Bunch..",
                  ),
                  CustomBordingPage(
                    image: "out_bording_three.png",
                    title: "Enjoy Purchase!",
                    subTitle:
                        "Now were up in the big leagues gettingour turn at bat. The Brady Bunch that's the way we  Brady Bunch..",
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomPageIndecator(selected: _pageSelected == 0),
                SizedBox(
                  width: 15,
                ),
                CustomPageIndecator(
                  selected: _pageSelected == 1,
                ),
                SizedBox(
                  width: 15,
                ),
                CustomPageIndecator(
                  selected: _pageSelected == 2,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Visibility(
              visible: _pageSelected == 2,
              maintainState: true,
              maintainSize: true,
              maintainAnimation: true,
              child: ElevatedButton(
                onPressed: () {
                  SharedPrefController().getLogin()
                      ? Navigator.pushReplacementNamed(context, "/home_screen")
                      : Navigator.pushReplacementNamed(context, "/sign_in_screen");
                },
                child: Text(
                  "START",
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6A90F2),
                  minimumSize: Size(315, 53),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
