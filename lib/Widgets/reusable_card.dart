import 'package:flutter/material.dart';

class BoxDesign extends StatelessWidget {
  BoxDesign({required this.selectedColor, this.cardChild, this.onPress});

  final Color selectedColor;
  final Widget? cardChild;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: selectedColor, //Color(0xFF1D1E33),
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(15),
      ),
    );
  }
}
