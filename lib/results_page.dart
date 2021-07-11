
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({required this.bmi,required this.interpretation,required this.result});
final String result;
final String  interpretation;
final String  bmi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 10,
            child: ReusableCard(
                colorVar: kActiveColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      result,
                      style: kWeightStyleOverWeight,
                    ),
                    Text(
                      bmi,
                      style: TextStyle(
                          fontSize: 60,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      interpretation,
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                onPressed: () {}),
          ),
          Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  child: Center(
                    child: Text(
                      'RECALCULATE',
                      style: kBottomBar,
                    ),
                  ),
                  color: Colors.pink,
                ),
              ))
        ],
      ),
    );
  }
}
