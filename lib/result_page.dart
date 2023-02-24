import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'Widgets/reusable_card.dart';
import 'Widgets/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {required this.bmiResult,
      required this.interpretation,
      required this.resultText,
      required this.resultColor});

  final String bmiResult;
  final String resultText;
  final String interpretation;
  final Color resultColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: kAppBarTitle),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Your Result',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ))),
          Expanded(
            flex: 5,
            child: BoxDesign(
              selectedColor: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(resultText,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: resultColor)),
                  Text(bmiResult, style: kBMITextStyle),
                  Text(interpretation,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22)),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonText: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
