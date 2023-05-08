import 'package:flutter/material.dart';

class CustomPageIndecator extends StatelessWidget {
  final bool selected;
  CustomPageIndecator({
    Key? key,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 17,
      height: 4,
      decoration: BoxDecoration(
        color: selected ? Color(0xFF6A90F2) : Color(0xFFDDDDDD),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
