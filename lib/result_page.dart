import 'package:bmi_calculator/all_class.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/result_page.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key,
  required this.bmiResult, 
  required this.interpretation, 
  required this.resultText
  });

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: ResultCard(
                color: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText,
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bmiResult,
                      style: TextStyle(
                          fontSize: 100.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: largeButtonTextStyle,
                ),
              ),
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.only(bottom: 20.0),
              width: double.infinity,
              height: 80.0,
            ),
          ),
        ],
      ),
    );
  }
}
