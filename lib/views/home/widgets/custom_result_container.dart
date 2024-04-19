import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/constants.dart';

class ResultContainer extends StatelessWidget {
  const ResultContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: Constants.mediaQuery.width * .25,
        height: Constants.mediaQuery.width * .25,
        decoration: const BoxDecoration(
          color: Color(0xff2566cf),
          borderRadius: BorderRadius.all(
            Radius.circular(22),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Constants.vm.result.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 36,
                fontFamily: 'Capriola',
              ),
            ),
            Text(
              'kg/m2',
              style: TextStyle(
                fontFamily: 'Inder',
                color: Colors.grey.shade300,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
