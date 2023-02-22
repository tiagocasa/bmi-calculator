import 'package:flutter/material.dart';

class BoxDesign extends StatelessWidget {
  BoxDesign({required this.selectedColor, this.cardChild});

  final Color selectedColor;
  final Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: selectedColor, //Color(0xFF1D1E33),
      ),
      margin: EdgeInsets.all(10),
    );
  }
}
