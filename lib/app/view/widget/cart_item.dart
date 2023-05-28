import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          "asset/images/handBag_one.png",
          width: 70,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Handbag",
              style: GoogleFonts.quicksand(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'from boots category',
              style:
                  GoogleFonts.roboto(fontWeight: FontWeight.w300, fontSize: 14),
            ),
            Text(
              "\$100",
              style: GoogleFonts.quicksand(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.cancel_outlined)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add),
                      alignment: Alignment.center,
                      iconSize: 20,
                    )),
                Text("2"),
                Container(
                    height: 50,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade200,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.minimize),
                      alignment: Alignment.center,
                      iconSize: 20,
                    )),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
