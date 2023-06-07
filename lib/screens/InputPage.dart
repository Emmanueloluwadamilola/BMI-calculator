import 'package:bmi/bmi_calculate.dart';
import 'package:bmi/reuseable_components/reuseable_card.dart';
import 'package:bmi/reuseable_components/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../reuseable_components/bottom_button.dart';
import '../constants.dart';
import '../reuseable_components/icon_content.dart';
import 'result_page.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({
    Key? key,
  }) : super(key: key);
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        backgroundColor: const Color(0xFF0A0E21),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ReuseableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: const IconContent(
                    myText: 'MALE',
                    myIcon: FontAwesomeIcons.mars,
                  ),
                ),
              ),
              Expanded(
                child: ReuseableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: const IconContent(
                    myText: 'FEMALE',
                    myIcon: FontAwesomeIcons.venus,
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: ReuseableCard(
            colour: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'HEIGHT',
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kLabelNumberStyle,
                    ),
                    const Text(
                      'cm',
                      style: kLabelTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbColor: const Color(0xFFEB1555),
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: const Color(0xFF8D8E98),
                    overlayColor: const Color(0x29EB1555),
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 15),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 30),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    onChanged: (double value) {
                      setState(() {
                        height = value.round();
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ReuseableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kLabelNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              }),
                          const SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReuseableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kLabelNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPress: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        BottomButton(
          ontap: () {
            Calculate calc = Calculate(weight: weight, height: height);

            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ResultPage(
                interpretation: calc.getInterpretation(),
                bmiResult: calc.calculateBMi(),
                resultText: calc.getResult(),
              );
            }));
          },
          buttonTitle: 'CALCULATE',
        ),
      ]),
    );
  }
}
