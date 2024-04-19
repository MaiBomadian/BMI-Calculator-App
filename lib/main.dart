import 'package:bmi_calculator_app/config/provider.dart';
import 'package:bmi_calculator_app/views/home/pages/home.dart';
import 'package:bmi_calculator_app/views/home/pages/result.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(ChangeNotifierProvider(create: (context) => BMIProvider(),
  child: const BmiApp()));
}

class BmiApp extends StatelessWidget {
  const BmiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        ResultPage.routeName: (context) => const ResultPage(),

      },
    );
  }
}
