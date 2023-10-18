import 'package:bmi_calculator/components/reuseable_card.dart';
import 'package:flutter/material.dart';

import '../components/constaints.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({required this.bmiResult,required this.resultText,required this.feedBack});
  late String bmiResult;
  late String resultText;
  late String feedBack;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16, top: 8),
                    child: Text(
                      "Your Result",
                      style: heightNumberTextStyle,
                    ),
                  )),
              Expanded(
                flex: 8,
                child: ReusableCard(
                    activeCardColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Center(
                                child: Text(
                          resultText.toUpperCase(),
                          style: TextStyle(fontSize: 25, color: Colors.greenAccent),
                        ))),
                        Expanded(
                            child: Center(
                                child: Text(
                          bmiResult,
                          style: TextStyle(
                              fontSize: 80, fontWeight: FontWeight.bold),
                        ))),
                        Expanded(
                            child: Center(
                          child: Text(feedBack,
                              textAlign: TextAlign.center),
                        ))
                      ],
                    ),
                    () {}),
              ),
              Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      color: buttonColor,
                      child: const Center(
                        child: Text(
                          "RE-CALCULATE",
                          style: labelTextStyle,
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ));
  }
}
