
import 'package:bmi_calculator/calculating/calculator_brain.dart';
import 'package:bmi_calculator/components/reuseable_card.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/cardContent.dart';
import '../components/constaints.dart';

enum PressedButton {
  maleButton,
  femaleButton,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = activeCardColor;
  Color femaleCardColor = inactiveCardColor;
  PressedButton pressedButton = PressedButton.maleButton;
  int height = 180;
  int weight = 50;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("BMI Calculator"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ReusableCard(
                        pressedButton == PressedButton.maleButton
                            ? activeCardColor
                            : inactiveCardColor,
                        CardContent(FontAwesomeIcons.mars, "MALE"), () {
                      setState(() {
                        pressedButton = PressedButton.maleButton;
                      });
                    }),
                  ),
                  Expanded(
                      flex: 1,
                      child: ReusableCard(
                          pressedButton == PressedButton.femaleButton
                              ? activeCardColor
                              : inactiveCardColor,
                          CardContent(FontAwesomeIcons.venus, "FEMALE"), () {
                        setState(() {
                          pressedButton = PressedButton.femaleButton;
                        });
                      })),
                ],
              ),
            ),
            Expanded(
                child: ReusableCard(
                    activeCardColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Height",
                          style: labelTextStyle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              height.toString(),
                              style: heightNumberTextStyle,
                            ),
                            const Text(
                              "cm",
                              style: labelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbColor: buttonColor,
                            overlayColor: const Color(0x29eb1555),
                            thumbShape:
                                const RoundSliderThumbShape(enabledThumbRadius: 14),
                            overlayShape:
                                const RoundSliderOverlayShape(overlayRadius: 25),
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Colors.grey[850],
                          ),
                          child: Slider(
                              value: height.toDouble(),
                              min: 120.0,
                              max: 220.0,
                              onChanged: (value) {
                                setState(() {
                                  height = value.toInt();
                                });
                              }),
                        )
                      ],
                    ),
                    () {})),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ReusableCard(
                        activeCardColor,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "WEIGHT",
                              style: labelTextStyle,
                            ),
                            Text(weight.toString(),
                                style: heightNumberTextStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      weight -= 1;
                                    });
                                  },
                                  icon: Icons.remove,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                RoundIconButton(
                                    onPressed: () {
                                      setState(() {
                                        weight += 1;
                                      });
                                    },
                                    icon: Icons.add)
                              ],
                            )
                          ],
                        ),
                        () {}),
                  ),
                  Expanded(
                    flex: 1,
                    child: ReusableCard(
                        activeCardColor,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "AGE",
                              style: labelTextStyle,
                            ),
                            Text(age.toString(), style: heightNumberTextStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      age -= 1;
                                    });
                                  },
                                  icon: Icons.remove,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                RoundIconButton(
                                    onPressed: () {
                                      setState(() {
                                        age += 1;
                                      });
                                    },
                                    icon: Icons.add)
                              ],
                            )
                          ],
                        ),
                        () {}),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
                  bmiResult: calc.calculatedBMI(),
                  resultText: calc.getResult(),
                  feedBack:calc.getFeedback(),
                )));
              },
              child: Container(
                color: buttonColor,
                margin: const EdgeInsets.only(top: 10),
                width: double.infinity,
                height: bottomContainerHeight,
                padding: const EdgeInsets.only(bottom: 10),
                child: const Center(child: Text("CALCULATE", style: labelTextStyle,)),
              ),
            )
          ],
        ));
  }
}
