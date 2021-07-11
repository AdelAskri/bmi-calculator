import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'card_data.dart';
import 'constants.dart';
import 'results_page.dart';
import 'bmi_calculator.dart';

enum GenderType { male, female, unassigned }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color(0xFF0E2132),
          scaffoldBackgroundColor: Color(0xFF0A0E21),
          iconTheme: IconThemeData(
            color: Colors.white,
            size: 80,
          ),
          sliderTheme: SliderThemeData(
            activeTrackColor: Colors.pink[600],
            thumbColor: Colors.pink[600],
            overlayColor: Color(0x1ff73bcf),
          ),
          textTheme: TextTheme(
            bodyText2: TextStyle(
              fontSize: 15,
              color: Colors.grey,
            ),
          )),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'BMI Calculator',
          ),
        ),
        body: InputPage(),
      ),
    );
  }
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedGender = GenderType.unassigned;
  int height = 170;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  onPressed: () {
                    setState(() {
                      selectedGender = GenderType.male;
                    });
                  },
                  colorVar: selectedGender == GenderType.male
                      ? kActiveColor
                      : kUnactiveColor,
                  cardChild: CardData(Icon(FontAwesomeIcons.mars), 'Male'),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPressed: () {
                    setState(() {
                      selectedGender = GenderType.female;
                    });
                  },
                  colorVar: selectedGender == GenderType.female
                      ? kActiveColor
                      : kUnactiveColor,
                  cardChild: CardData(Icon(FontAwesomeIcons.venus), 'Female'),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ReusableCard(
            colorVar: kActiveColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('HEIGHT'),
                SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      height.toString(),
                      style: kBigTextStyle,
                    ),
                    Text('CM'),
                  ],
                ),
                Slider(
                    max: 230,
                    min: 120,
                    inactiveColor: Colors.grey,
                    value: height.toDouble(),
                    onChanged: (newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    })
              ],
            ),
            onPressed: () {},
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  onPressed: () {},
                  colorVar: kActiveColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT'),
                      Text(
                        weight.toString(),
                        style: kBigTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedIcon(
                              mIcon: FontAwesomeIcons.minus,
                              functionPress: () {
                                setState(() {
                                  weight--;
                                });
                              }),
                          SizedBox(
                            width: 10,
                          ),
                          RoundedIcon(
                              mIcon: FontAwesomeIcons.plus,
                              functionPress: () {
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
                  onPressed: () {},
                  colorVar: kActiveColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('AGE'),
                      Text(
                        age.toString(),
                        style: kBigTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedIcon(
                              mIcon: FontAwesomeIcons.minus,
                              functionPress: () {
                                setState(() {
                                  age--;
                                });
                              }),
                          SizedBox(
                            width: 10,
                          ),
                          RoundedIcon(
                              mIcon: FontAwesomeIcons.plus,
                              functionPress: () {
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
            BmiCalculator bmiCalc = BmiCalculator(
                height: height.toDouble(), weight: weight.toDouble());
            print(height.toString());
            print(bmiCalc.calculateBmi());
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ResultsPage(
                    //TODO 3 send parameters needed
                    bmi: bmiCalc.calculateBmi(),
                    interpretation: bmiCalc.getInterpretation(),
                    result: bmiCalc.getResult(),
                  );
                },
              ),
            );
          },
          child: Container(
            child: Center(
              child: Text('CALCULATE', style: kBottomBar),
            ),
            color: Colors.pink[600],
            width: double.infinity,
            height: 60,
            margin: EdgeInsets.only(top: 10),
          ),
        )
      ],
    );
  }
}

class RoundedIcon extends StatelessWidget {
  const RoundedIcon(
      {this.mIcon = FontAwesomeIcons.female, required this.functionPress});

  final IconData mIcon;
  final VoidCallback functionPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(width: 50, height: 50),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      onPressed: functionPress,
      child: Icon(
        mIcon,
        size: 25,
      ),
    );
  }
}
