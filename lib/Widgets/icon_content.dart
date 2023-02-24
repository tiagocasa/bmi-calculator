import 'package:flutter/material.dart';
import '../constants.dart';

class IconAndName extends StatelessWidget {
  IconAndName({required this.iconName, required this.textLabel});

  final IconData iconName;
  final String textLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(iconName, size: 90),
        SizedBox(height: 15),
        Text(
          textLabel,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
