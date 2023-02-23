import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF11132A);
const bottomContainerColor = Color(0xFFEB1555);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      maleCardColor = activeCardColor;
                      femaleCardColor = inactiveCardColor;
                    });
                  },
                  child: BoxDesign(
                      selectedColor: maleCardColor,
                      cardChild: IconAndName(
                        iconName: FontAwesomeIcons.mars,
                        textLabel: 'MALE',
                      )),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      maleCardColor = inactiveCardColor;
                      femaleCardColor = activeCardColor;
                    });
                  },
                  child: BoxDesign(
                      selectedColor: femaleCardColor,
                      cardChild: IconAndName(
                        iconName: FontAwesomeIcons.venus,
                        textLabel: 'FEMALE',
                      )),
                ))
              ],
            )),
            Expanded(child: BoxDesign(selectedColor: activeCardColor)),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(child: BoxDesign(selectedColor: activeCardColor)),
                Expanded(child: BoxDesign(selectedColor: activeCardColor)),
              ],
            )),
            Container(
              color: bottomContainerColor,
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: bottomContainerHeight,
            ),
          ],
        ));
  }
}
