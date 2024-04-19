import 'package:flutter/material.dart';

class BMIProvider extends ChangeNotifier {
  bool isSelected = true;
  String result = '';
  double weight = 10;
  int age = 0;
  double height = 20;
  String bmiCategory = '';

  calculateBMI(weight, height) {
    height = height / 100;
    double bmi = weight / (height * height);
    result = bmi.toStringAsFixed(1);
    notifyListeners();
  }

  determineBMICategory() {
    double bmiValue = double.parse(result);

    if (bmiValue < 18.5) {
      bmiCategory = 'Underweight';
      notifyListeners();
      return bmiCategory;
    } else if (bmiValue >= 18.5 && bmiValue <= 25) {
      bmiCategory = 'Normal';
      notifyListeners();
      return bmiCategory;
    } else if (bmiValue >= 25 && bmiValue < 30) {
      bmiCategory = 'Overweight';
      notifyListeners();
      return bmiCategory;
    } else {
      bmiCategory = 'Obese';
      notifyListeners();

      return bmiCategory;
    }
  }

  bmiCategoryRange() {
    switch (bmiCategory) {
      case 'Underweight':
        return '( < 18.5)';
        break;
      case 'Normal':
        return '(18.5 - 24.9)';
        break;
      case 'Overweight':
        return '(25 - 29.9)';
        break;
      case 'Obese':
        return '( > 30)';
        break;
      default:
        return '';
        break;
    }
    // if (bmiCategory == 'Underweight') {
    //   return result.toString();
    // }
    // else if (bmiCategory == 'Normal') {
    //   return '18.5 - 24.9';
    // }
    // else if (bmiCategory == 'Overweight') {
    //   return '25 - 29.9';
    // } else if (bmiCategory == 'Obese') {
    //   return '30 - 34.9';
    // }
  }

  selectGender(bool isSelected) {
    this.isSelected = isSelected;
    notifyListeners();
  }
}
