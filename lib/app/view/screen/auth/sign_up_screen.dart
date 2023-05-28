import 'package:e_commerce_app/app/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController _firstNameTextController;
  late TextEditingController _lastNameTextController;
  late TextEditingController _emailTextController;
  late TextEditingController _phoneTextController;
  late TextEditingController _passwordTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firstNameTextController = TextEditingController();
    _lastNameTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _phoneTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    _firstNameTextController.dispose();
    _lastNameTextController.dispose();
    _emailTextController.dispose();
    _phoneTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 60,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF000000),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(27),
        child: ListView(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 26,
                ),
                Text(
                  "Sign Up",
                  style: GoogleFonts.neuton(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  "Create an account",
                  style: GoogleFonts.roboto(
                      fontSize: 18, fontWeight: FontWeight.w300),
                ),
                const SizedBox(
                  height: 37,
                ),
                TextField(
                  controller: _firstNameTextController,
                  keyboardType: TextInputType.name,
                  style: GoogleFonts.roboto(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    hintText: "First Name",
                    hintStyle: GoogleFonts.roboto(
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFD0D0D0), width: 1),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                TextField(
                  controller: _lastNameTextController,
                  keyboardType: TextInputType.name,
                  style: GoogleFonts.roboto(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    hintText: "Last Name",
                    hintStyle: GoogleFonts.roboto(
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                    ),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFD0D0D0), width: 1)),
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                TextField(
                  controller: _emailTextController,
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
                    focusedBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFD0D0D0), width: 1)),
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                TextField(
                  controller: _phoneTextController,
                  keyboardType: TextInputType.phone,
                  style: GoogleFonts.roboto(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    hintText: "Phone",
                    hintStyle: GoogleFonts.roboto(
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                    ),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFD0D0D0), width: 1)),
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
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
                    focusedBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFD0D0D0), width: 1)),
                  ),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 35,
                ),
                ElevatedButton(
                    onPressed: () {
                      _register();
                    },
                    child: const Text("Sign Up"),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(315, 53),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool checkData() {
    if (_firstNameTextController.text.isNotEmpty &&
        _lastNameTextController.text.isNotEmpty &&
        _emailTextController.text.isNotEmpty &&
        _phoneTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      return true;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Enter Required Data"),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
    return false;
  }

  void register() {
    Navigator.pushReplacementNamed(context, "/sign_in_screen");
  }

  void performRegister() {
    if (checkData()) {
      register();
    }
  }

  void _register() async {
    bool saved = await UserController().save(
        _firstNameTextController.text,
        _lastNameTextController.text,
        _emailTextController.text,
        _phoneTextController.text,
        _passwordTextController.text);
    if (saved) {
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Registration failed, check and try again"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
