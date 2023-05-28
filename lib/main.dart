import 'app/storage/db_controller.dart';
import 'app/storage/shared_prefrenses_controller.dart';
import 'app/view/screen/auth/sign_in.dart';
import 'app/view/screen/auth/sign_up_screen.dart';
import 'app/view/screen/cart_screen.dart';
import 'app/view/screen/home_screen.dart';
import 'app/view/screen/launch_screen.dart';
import 'app/view/screen/out_bourding/out_bording_screen.dart';
import 'app/view/screen/product_detailes.dart';
import 'app/view/screen/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPrefrenses();
  await DbController().initDatabase();

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
        "/launch_screen": (context) => const LaunchScreen(),
        "/out_bording_screen": (context) => const OutBordingScreen(),
        "/sign_in_screen": (context) => const SignIn(),
        "/sign_up_screen": (context) => const SignUpScreen(),
        "/home_screen": (context) => HomeScreen(),
        "/product_detailes": (context) => const ProductDetailes(),
        "/cart_screen": (context) => const CartScreen(),
        "/setting_screen": (context) => const SettingScreen(),
      },
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [
        Locale("en"),
        Locale("ar"),
      ],
      locale: const Locale("en"),
    );
  }
}
