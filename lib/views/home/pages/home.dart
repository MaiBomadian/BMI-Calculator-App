import 'package:bmi_calculator_app/views/home/pages/result.dart';
import 'package:bmi_calculator_app/views/home/widgets/custom_button.dart';
import 'package:bmi_calculator_app/views/home/widgets/custom_gender_container.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../../../config/provider.dart';
import '../widgets/custom_age_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String routeName = "Home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<BMIProvider>(context);
    var mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            const Text(
              'BMI Calculator',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inder'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Gender',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inder',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                CustomGenderContainer(
                  borderColor: isSelected
                      ? const Color(0xff6c98de)
                      : const Color(0xffd9d9d9),
                  iconColor: isSelected
                      ? const Color(0xff2b67cf)
                      : const Color(0xff8b8b8b),
                  color: isSelected
                      ? const Color(0xffe0e9f8)
                      : const Color(0xffd9d9d9),
                  iconData: Icons.man,
                  text: 'Male',
                  onTap: () {
                    setState(() {
                      isSelected = true; // Male is selected
                    });
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                CustomGenderContainer(
                  borderColor: isSelected
                      ? const Color(0xffd9d9d9)
                      : const Color(0xff6c98de),
                  iconColor: isSelected
                      ? const Color(0xff8b8b8b)
                      : const Color(0xff2b67cf),
                  color: isSelected
                      ? const Color(0xffd9d9d9)
                      : const Color(0xffe0e9f8),
                  // color: vm.isMale()?Colors.white:const Color(0xffd9d9d9),
                  iconData: Icons.woman,
                  text: 'Female',
                  onTap: () {
                    setState(() {
                      isSelected = false; // Female is selected
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 26),
            const Text(
              'Height (cm)',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inder'),
            ),
            SfSlider(
              activeColor: const Color(0xff2566cf),
              shouldAlwaysShowTooltip: true,
              min: 0.0,
              max: 200.0,
              value: vm.height,
              interval: 20,
              showTicks: true,
              showLabels: true,
              enableTooltip: false,
              onChanged: (value) {
                setState(() {
                  vm.height = value;
                });
              },
            ),
            const SizedBox(height: 26,),
            const CustomAgeContainer(),
            const SizedBox(
              height: 26,
            ),
            const Text(
              'Weight (kg)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inder',
              ),
            ),
            SizedBox(
              height: mediaQuery.width * .3,
              child: Center(
                child: NumberPicker(
                  selectedTextStyle: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Capriola',
                  ),
                  itemCount: 3,
                  itemWidth: 120,
                  itemHeight: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey),
                  ),
                  textStyle: const TextStyle(
                    fontFamily: 'Capriola',
                  ),
                  axis: Axis.horizontal,
                  value: vm.weight.toInt(),
                  minValue: 0,
                  maxValue: 200,
                  onChanged: (value) {
                    setState(() {
                      vm.weight = value.toDouble();
                    });
                  },
                ),
              ),
            ),
            const Spacer(),
            CustomElevatedButton(
                textButton: 'CALCULATE BMI',
                onPressed: () {
                  vm.calculateBMI(vm.weight, vm.height);
                  vm.determineBMICategory();
                  vm.selectGender(isSelected);
                  Navigator.of(context).pushNamed(ResultPage.routeName);
                }),
          ],
        ),
      ),
    );
  }
}
