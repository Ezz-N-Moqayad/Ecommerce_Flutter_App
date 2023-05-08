import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, "/out_bording_screen");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("asset/images/Rectangle 9.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(54),
          child: Column(
            children: [
              SizedBox(height: 118,),
              Image.asset("asset/images/launch_name.png"),
              SizedBox(height: 20,),
              Text("FASHIONS", style: GoogleFonts.poppins(
                fontSize: 15,
                fontStyle: FontStyle.italic,
                letterSpacing: 3,
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
