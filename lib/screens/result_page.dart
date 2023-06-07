import 'package:bmi/screens/InputPage.dart';
import 'package:flutter/material.dart';
import '../reuseable_components/bottom_button.dart';
import '../constants.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {Key? key,
      required this.bmiResult,
      required this.resultText,
      required this.interpretation})
      : super(key: key);

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Your Result ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                )),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kActiveCardColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // SizedBox(
                    //   height: 25.0,
                    // ),
                    Text(
                      resultText.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                    // SizedBox(
                    //   height: 50.0,
                    // ),
                    Text(
                      bmiResult,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // SizedBox(
                    //   height: 50.0,
                    // ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
            BottomButton(
              ontap: () {
                Navigator.pop(context, MaterialPageRoute(builder: (context) {
                  return const InputPage();
                }));
              },
              buttonTitle: 'RECALCULATE',
            ),
          ],
        ));
  }
}
