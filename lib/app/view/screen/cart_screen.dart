import 'package:e_commerce_app/app/view/widget/cart_item.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const SizedBox(height: 25),
          Text(
            "3 items available",
            style: GoogleFonts.quicksand(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const CartItem(),
          const SizedBox(height: 10),
          const CartItem(),
          const SizedBox(height: 10),
          const CartItem(),
          const SizedBox(height: 48),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sub total:",
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "\$100",
                    style: GoogleFonts.quicksand(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tax(15%):",
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "\$15",
                    style: GoogleFonts.quicksand(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Divider(indent: 20, endIndent: 20),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total:",
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "\$215",
                    style: GoogleFonts.quicksand(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Checkout"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6A90F2),
                  minimumSize: const Size(332, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
