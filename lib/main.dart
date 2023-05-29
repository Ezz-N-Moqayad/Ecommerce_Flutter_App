import 'package:e_commerce_app/app/storage/db_controller.dart';
import 'package:e_commerce_app/app/storage/shared_prefrenses_controller.dart';
import 'package:e_commerce_app/app/view/screen/auth/sign_in.dart';
import 'package:e_commerce_app/app/view/screen/auth/sign_up_screen.dart';
import 'package:e_commerce_app/app/view/screen/cart_screen.dart';
import 'package:e_commerce_app/app/view/screen/home_screen.dart';
import 'package:e_commerce_app/app/view/screen/launch_screen.dart';
import 'package:e_commerce_app/app/view/screen/out_bourding/out_bording_screen.dart';
import 'package:e_commerce_app/app/view/screen/product_detailes.dart';
import 'package:e_commerce_app/app/view/screen/setting_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/view/screen/add_product.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPrefrenses();
  await DbController().initDatabase();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/launch_screen",
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Color(0xFF474459),
          ),
          foregroundColor: Color(0xFF474559),
        ),
      ),
      routes: {
        "/launch_screen": (context) => LaunchScreen(),
        "/out_bording_screen": (context) => OutBordingScreen(),
        "/sign_in_screen": (context) => SignIn(),
        "/sign_up_screen": (context) => SignUpScreen(),
        "/home_screen": (context) => HomeScreen(),
        "/product_detailes": (context) => ProductDetailes(),
        "/cart_screen": (context) => CartScreen(),
        "/setting_screen": (context) => SettingScreen(),
        "/add_product": (context) => AddProduct(),
      },
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        Locale("en"),
        Locale("ar"),
      ],
      locale: Locale("en"),
    );
  }
}
