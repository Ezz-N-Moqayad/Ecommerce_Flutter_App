import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../controller/product_controller.dart';
import '../../model/product.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  late TextEditingController _nameTextController;
  late TextEditingController _categoryTextController;
  late TextEditingController _descriptionTextController;
  late TextEditingController _priceTextController;
  late TextEditingController _imageTextController;

  @override
  void initState() {
    super.initState();
    _nameTextController = TextEditingController();
    _categoryTextController = TextEditingController();
    _descriptionTextController = TextEditingController();
    _priceTextController = TextEditingController();
    _imageTextController = TextEditingController();
  }

  @override
  void dispose() {
    _nameTextController.dispose();
    _categoryTextController.dispose();
    _descriptionTextController.dispose();
    _priceTextController.dispose();
    _imageTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productController = Provider.of<ProductController>(context);

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
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(27),
        child: ListView(
          children: [
            Column(
              children: [
                const SizedBox(height: 26),
                Text(
                  "App Product",
                  style: GoogleFonts.neuton(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "Create a new product",
                  style: GoogleFonts.roboto(
                      fontSize: 18, fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 37),
                TextField(
                  controller: _nameTextController,
                  keyboardType: TextInputType.name,
                  style: GoogleFonts.roboto(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    hintText: "Name Product",
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
                  controller: _categoryTextController,
                  keyboardType: TextInputType.name,
                  style: GoogleFonts.roboto(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    hintText: "Category",
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
                  controller: _descriptionTextController,
                  keyboardType: TextInputType.multiline,
                  style: GoogleFonts.roboto(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    hintText: "Description",
                    hintStyle: GoogleFonts.roboto(
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFD0D0D0),
                        width: 1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 17),
                TextField(
                  controller: _priceTextController,
                  keyboardType: TextInputType.number,
                  style: GoogleFonts.roboto(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    hintText: "Price",
                    hintStyle: GoogleFonts.roboto(
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFD0D0D0),
                        width: 1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 17),
                TextField(
                  controller: _imageTextController,
                  style: GoogleFonts.roboto(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    hintText: "Image",
                    hintStyle: GoogleFonts.roboto(
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFD0D0D0),
                        width: 1,
                      ),
                    ),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 35),
                ElevatedButton(
                  onPressed: () {
                    final product = Product(
                      name: _nameTextController.text ?? '',
                      category: _categoryTextController.text ?? '',
                      description: _descriptionTextController.text ?? '',
                      price: _priceTextController.text ?? '',
                      image: _imageTextController.text ?? '',
                    );

                    productController.addProduct(product);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(315, 53),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text("Create Product"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool checkData() {
    if (_nameTextController.text.isNotEmpty &&
        _categoryTextController.text.isNotEmpty &&
        _descriptionTextController.text.isNotEmpty &&
        _priceTextController.text.isNotEmpty &&
        _imageTextController.text.isNotEmpty) {
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

  // void _register() async {
  //   bool saved = await ProductController().save(
  //     _nameTextController.text,
  //     _categoryTextController.text,
  //     _descriptionTextController.text,
  //     _priceTextController.text,
  //     _imageTextController.text,
  //   );
  //   if (saved) {
  //     Navigator.pop(context);
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text("Registration failed, check and try again"),
  //         backgroundColor: Colors.red,
  //       ),
  //     );
  //   }
  // }
}
