import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../calculator_brain.dart';
import '../constants.dart';
import '../components/bottom_button.dart';
import '../screens/results_page.dart';
import '../components/round_icon_button.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
// import 'package:provider/provider.dart';

enum GenderEnum { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderEnum? selectedGender;
  int height = 180, weight = 60, age = 30;

  // Widget reusableCard(
  //     {required Color colour, Widget? cardChild, GenderEnum? newGender}) {
  //   return GestureDetector(
  //     onTap: () {
  //       setState(() {
  //         selectedGender = newGender;
  //       });
  //     },
  //     child: Container(
  //       child: cardChild,
  //       decoration: BoxDecoration(
  //         color: colour,
  //         borderRadius: BorderRadius.circular(10.0),
  //       ),
  //       margin: EdgeInsets.all(15),
  //     ),
  //   );
  // }

  // void _IPsetState(GenderEnum newGender) {
  //   setState(() {
  //     selectedGender = newGender;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  // child: reusableCard(
                  // newGender: GenderEnum.male,
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderEnum.male;
                      });
                    },
                    colour: selectedGender == GenderEnum.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  // child: reusableCard(
                  // newGender: GenderEnum.female,
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderEnum.female;
                      });
                    },
                    colour: selectedGender == GenderEnum.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            // child: reusableCard(
            child: ReusableCard(
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
                    children: [
                      Text(height.toString(), style: kNumberTextStyle),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: kLightGray,
                      activeTrackColor: Colors.white,
                      thumbColor: kReddishColour,
                      overlayColor: kReddishColour.withOpacity(0.16),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
              colour: kActiveCardColour,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  // child: reusableCard(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      children: [
                        Text('WEIGHT', style: kLabelTextStyle),
                        Text(weight.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  if (weight > 0)
                                    weight--;
                                  else
                                    print('Age cannot be below 0');
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  // child: reusableCard(
                  child: ReusableCard(
                    cardChild: Column(
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  if (age > 0)
                                    age--;
                                  else
                                    print('calibrate your device');
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                    colour: kActiveCardColour,
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'Calculate',
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.bmiValue(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
