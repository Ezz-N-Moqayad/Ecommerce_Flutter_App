import 'package:e_commerce_app/app/storage/shared_prefrenses_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(height: 40,),
                CircleAvatar(
                  maxRadius: 100,
                  child: Image.network("https://png.pngtree.com/png-vector/20220709/ourmid/pngtree-businessman-user-avatar-wearing-suit-with-red-tie-png-image_5809521.png",
                      height: 135,
                      width: 135,
                  ),
                  backgroundColor: Colors.white,
                ),
                SizedBox(height: 20,),
                Text("John Deo", style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),),
                SizedBox(height: 7,),
                Text("johndeo@yourmail.com", style: GoogleFonts.quicksand(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),),
                SizedBox(height: 40,),
                Divider(),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("My Profile", style: GoogleFonts.quicksand(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text("Favorites", style: GoogleFonts.quicksand(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.list_alt),
                  title: Text("Orders", style: GoogleFonts.quicksand(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.pending_actions),
                  title: Text("Terms & Conditions", style: GoogleFonts.quicksand(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.lock),
                  title: Text("Privacy Policy", style: GoogleFonts.quicksand(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),),
                ),
                Divider(),
                InkWell(
                  onTap: () {
                    SharedPrefController().clear();
                    Navigator.pushReplacementNamed(context, "/sign_in_screen");
                  },
                  child: ListTile(
                    leading: Icon(Icons.logout),
                    title: Text("Logout", style: GoogleFonts.quicksand(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
