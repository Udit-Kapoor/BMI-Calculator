import 'package:flutter/material.dart';
import 'constants.dart';
import 'brain.dart';

class ResultPage extends StatelessWidget {
  final String bmi;
  final String result;
  final String interpretation;
  ResultPage(
      {@required this.bmi,
      @required this.result,
      @required this.interpretation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    result.toUpperCase(),
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF24D876),
                    ),
                  ),
                  Text(
                    bmi,
                    style: TextStyle(
                      fontSize: 100.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.0,
                    ),
                  ),
                ],
              ),
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Color(0xFF1D1E33),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                //Go back to input page
                Navigator.pop(context);
              },
              child: Container(
                child: Center(
                  child: Text(
                    'RE-CALCULATE',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35.0,
                    ),
                  ),
                ),
                height: 80.0,
                width: double.infinity,
                color: kbottomContainerCol,
                margin: EdgeInsets.only(top: 10.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
