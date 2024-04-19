import 'package:bmi_calculator_app/views/home/widgets/custom_result_container.dart';
import 'package:flutter/material.dart';

import '../../../config/constants.dart';
import '../widgets/custom_button.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);
  static const String routeName = "result";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        title: const Text(
          'Back',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, fontFamily: 'Inder'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Result',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inder'),
            ),
            const SizedBox(height: 22),
            const Center(
              child: Text(
                'Your BMI is',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inder',
                ),
              ),
            ),
            const SizedBox(height: 22),
            const ResultContainer(),
            const SizedBox(height: 30),
            Center(
              child: Text(
                '(${Constants.vm.bmiCategory})',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inder'),
              ),
            ),
            const SizedBox(height: 30),
            const RecordInfo(),
            const SizedBox(height: 18),
            Container(
              height: Constants.mediaQuery.width * .52,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey),
              ),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'A BMI of ',
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Inder',
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: Constants.vm.bmiCategoryRange(),
                      style: const TextStyle(
                        fontFamily: 'Inder',
                        color: Color(0xff2566cf),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const TextSpan(
                      text: ' indicates that your weight is in the ',
                      style: TextStyle(
                        fontFamily: 'Inder',
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: Constants.vm.bmiCategory,
                      style: const TextStyle(
                        fontFamily: 'Inder',
                        color: Color(0xff2566cf),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const TextSpan(
                      text:
                          ' category for a person of your height.\n\n Maintaining a healthy weight reduces the risk of diseases associated with overweight and obesity.  ',
                      style: TextStyle(
                        fontFamily: 'Inder',
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            CustomElevatedButton(
                iconData: Icons.refresh,
                textButton: 'TRY AGAIN',
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}

class RecordInfo extends StatelessWidget {
  const RecordInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      height: Constants.mediaQuery.width * .28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Constants.vm.isSelected ? Icons.man : Icons.woman,
                size: 48,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                Constants.vm.isSelected ? 'Male' : 'Female',
                style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'inder',
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Constants.vm.age.toString(),
                style: const TextStyle(
                    fontSize: 30,
                    fontFamily: 'Capriola',
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Age',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'inder',
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                (Constants.vm.height.toInt()).toString(),
                style: const TextStyle(
                    fontSize: 30,
                    fontFamily: 'Capriola',
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Height',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'inder',
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                (Constants.vm.weight.toInt()).toString(),
                style: const TextStyle(
                    fontSize: 30,
                    fontFamily: 'Capriola',
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Weight',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'inder',
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }
}
