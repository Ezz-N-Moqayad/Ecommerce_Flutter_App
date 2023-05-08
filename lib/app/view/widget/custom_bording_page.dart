import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBordingPage extends StatelessWidget {
  late String image;
  late String title;
  late String subTitle;
   CustomBordingPage({
    Key? key,
    required this.image,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("asset/images/$image", height: 300,),
        SizedBox(height: 36,),
        Padding(
          padding: const EdgeInsets.all(34.0),
          child: Column(
            children: [
              Text("${title}", style: GoogleFonts.neuton(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Color(0xFF23203F),
              ),),
              SizedBox(height: 21,),

              Text("${subTitle}", style: GoogleFonts.openSans(
                fontSize: 17,
                fontWeight: FontWeight.w300,
                color: Color(0xFF716F87),
              ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}