import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Widgets/reusable_card.dart';
import 'Widgets/icon_content.dart';
import 'constants.dart';
import 'Widgets/round_icon_button.dart';
import 'result_page.dart';
import 'Widgets/bottom_button.dart';
import 'calculator_brain.dart';

enum Gender { none, male, female }

enum Math { add, sub }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.none;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: kAppBarTitle),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: BoxDesign(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      selectedColor: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconAndName(
                        iconName: FontAwesomeIcons.mars,
                        textLabel: 'MALE',
                      )),
                ),
                Expanded(
                  child: BoxDesign(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      selectedColor: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconAndName(
                        iconName: FontAwesomeIcons.venus,
                        textLabel: 'FEMALE',
                      )),
                )
              ],
            )),
            Expanded(
                child: BoxDesign(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(' cm', style: kLabelTextStyle),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 15)),
                          child: Slider(
                            value: height.toDouble(),
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                            max: kMaxHeight,
                            min: kMinHeight,
                            activeColor: kActiveSliderColor,
                            inactiveColor: kInactiveSliderColor,
                          ),
                        )
                      ],
                    ),
                    selectedColor: kActiveCardColor)),
            Expanded(
                child: Row(children: <Widget>[
              Expanded(
                  child: BoxDesign(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('WEIGHT', style: kLabelTextStyle),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: <Widget>[
                                Text(weight.toString(),
                                    style: kNumberTextStyle),
                                Text(' kg', style: kLabelTextStyle),
                              ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(width: 20.0),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      selectedColor: kActiveCardColor)),
              Expanded(
                  child: BoxDesign(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('AGE', style: kLabelTextStyle),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: <Widget>[
                                Text(age.toString(), style: kNumberTextStyle),
                                Text(' yrs', style: kLabelTextStyle),
                              ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(width: 20.0),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      selectedColor: kActiveCardColor)),
            ])),
            BottomButton(
              buttonText: 'CALCULATE',
              onTap: () {
                CalculatorBrain brain =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                              bmiResult: brain.calculateBMI(),
                              interpretation: brain.getInterpretation(),
                              resultText: brain.getResult(),
                              resultColor: brain.getColor(),
                            )));
              },
            ),
          ],
        ));
  }
}
