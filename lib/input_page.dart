import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'RoundButton.dart';
import '_results.dart';
import 'brain.dart';
import 'package:audioplayers/audio_cache.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color male = kinactCardCol;
  Color female = kinactCardCol;
  final player = new AudioCache();

  void tap(int gender) {
    //1 = male , 2=female
    if (gender == 1) {
      male = kResuableCardCol;
      female = kinactCardCol;
    } else if (gender == 2) {
      female = kResuableCardCol;
      male = kinactCardCol;
    }
  }

  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      player.play('buttonclick.mp3');
                      setState(() {
                        tap(1);
                      });
                    },
                    child: ReusableCard(
                      col: male,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.mars,
                            size: 80.0,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text('Male', style: klabeltext),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      player.play('buttonclick.mp3');
                      setState(() {
                        tap(2);
                      });
                    },
                    child: ReusableCard(
                      col: female,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.venus,
                            size: 80.0,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'Female',
                            style: klabeltext,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: klabeltext,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: kNumText,
                            ),
                            SizedBox(
                              width: 2.0,
                            ),
                            Text(
                              'cm',
                              style: klabeltext,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 25.0),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120,
                            max: 220,
                            activeColor: Color(0xFFEB1555),
                            inactiveColor: Color(0xFF8D8E98),
                            onChanged: (double newVal) {
                              setState(() {
                                height = newVal.round();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    col: kResuableCardCol,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    col: kResuableCardCol,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: klabeltext,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundButton(
                                child: Icon(FontAwesomeIcons.minus),
                                onPressed: () {
                                  player.play('buttonclick.mp3');
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            SizedBox(
                              width: 8.0,
                            ),
                            RoundButton(
                                child: Icon(FontAwesomeIcons.plus),
                                onPressed: () {
                                  player.play('buttonclick.mp3');
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
                  child: ReusableCard(
                    col: kResuableCardCol,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: klabeltext,
                        ),
                        Text(
                          age.toString(),
                          style: kNumText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundButton(
                                child: Icon(FontAwesomeIcons.minus),
                                onPressed: () {
                                  player.play('buttonclick.mp3');
                                  setState(() {
                                    age--;
                                  });
                                }),
                            SizedBox(
                              width: 8.0,
                            ),
                            RoundButton(
                                child: Icon(FontAwesomeIcons.plus),
                                onPressed: () {
                                  player.play('buttonclick.mp3');
                                  setState(() {
                                    age++;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              brain calc = new brain(height: height, weight: weight);

              //Go to result page
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultPage(
                  bmi: calc.calculateBMI(),
                  result: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                );
              }));
            },
            child: Container(
              child: Center(
                child: Text(
                  'CALCULATE',
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
          )
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.col, this.cardChild});
  final Color col;
  final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: col,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
