import 'package:bmi_calculator_app/config/constants.dart';
import 'package:flutter/material.dart';


class CustomAgeContainer extends StatefulWidget {
  const CustomAgeContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomAgeContainer> createState() => _CustomAgeContainerState();
}

class _CustomAgeContainerState extends State<CustomAgeContainer> {
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        const Text(
          'Age',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Inder',
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: Constants.mediaQuery.width*.2,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  if (Constants.vm.age > 0) {
                    Constants.vm.age--;
                  }
                  setState(() {});
                },
                icon: const Icon(
                  Icons.remove,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  Constants.vm.age.toString(),
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Capriola',
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  Constants.vm.age++;
                  setState(() {});
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
