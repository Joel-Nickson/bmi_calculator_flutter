import 'dart:math';

class CalculatorBrain {
  final int height, weight;
  double _bmi = 0.0;

  CalculatorBrain({required this.height, required this.weight}) {
    _bmi = weight / pow(height / 100, 2);
  }

  String bmiValue() {
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 29.9) {
      return 'Obese';
    } else if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 29.9) {
      return 'You must really see a doctor and excercise more';
    } else if (_bmi >= 25) {
      return 'Try to excercise more';
    } else if (_bmi >= 18.5) {
      return 'Good job on staying fit';
    } else {
      return 'You can eat a bit more';
    }
  }
}
