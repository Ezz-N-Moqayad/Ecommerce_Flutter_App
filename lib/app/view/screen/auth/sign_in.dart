import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {


  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late TextEditingController _emailTextControll;
  late TextEditingController _passwordTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailTextControll = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextControll.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(27),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 120,),
            Text("Sign In", style: GoogleFonts.neuton(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),),
            SizedBox(
              height: 6,
            ),
            Text("Login to start using app,", style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.w300
            ),),
            SizedBox(height: 37,),

            TextField(
              controller: _emailTextControll,
              keyboardType: TextInputType.emailAddress,
              style: GoogleFonts.roboto(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                hintText: "Email",
                hintStyle: GoogleFonts.roboto(
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFD0D0D0),
                    width: 1
                  )
                ),
              ),
            ),
            SizedBox(height: 30,),
            TextField(
              controller: _passwordTextController,
              style: GoogleFonts.roboto(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: GoogleFonts.roboto(
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFD0D0D0),
                      width: 1
                    )
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 25,),
            ElevatedButton(onPressed: (){
              Navigator.pushReplacementNamed(context, "/home_screen");
            }, child: Text("LOGIN"), style: ElevatedButton.styleFrom(
              minimumSize: Size(315, 53),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            )),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don’t have an account?", style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),),
                InkWell(
                  child: Text(" Sign up", style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),),
                  onTap: () {
                    Navigator.pushNamed(context, "/sign_up_screen");
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
