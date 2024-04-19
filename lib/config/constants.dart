import 'package:bmi_calculator_app/config/provider.dart';
import 'package:bmi_calculator_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Constants {
  static var vm = Provider.of<BMIProvider>(navigatorKey.currentState!.context);
  static var mediaQuery =
      MediaQuery.of(navigatorKey.currentState!.context).size;
}
