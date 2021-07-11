import 'dart:math';

class BmiCalculator {
  //TODO 2 initialize variables here
  BmiCalculator({
    required this.weight,
    required this.height,
  });

//TODO 1 add final variables here
  final double weight;
  final double height;
  double _bmi = 10;

  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi > 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretation() {
    if (_bmi > 25) {
      return 'You are fat but beautiful';
    } else if (_bmi > 18.5) {
      return 'Eating healthy aren\'t you ?';
    } else {
      return 'Eat more you skinny rat!';
    }
  }
//TODO 4 add your functions here...
}
