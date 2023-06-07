import 'dart:math';

class Calculate {
  Calculate({required this.weight, required this.height});
  final int height;
  final int weight;

  String calculateBMi() {
    double _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    double _bmi = weight / pow(height / 100, 2);
    if (25 <= _bmi) {
      return 'Overweight';
    } else {
      if (_bmi >= 18.5) {
        return 'Normal';
      } else {
        return 'UnderWeight';
      }
    }
  }

  String getInterpretation() {
    double _bmi = weight / pow(height / 100, 2);
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
