import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/provider.dart';

class ResultContainer extends StatelessWidget {
  const ResultContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<BMIProvider>(context);

    var mediaQuery = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: mediaQuery.width*.25,
        height: mediaQuery.width * .25,
        decoration: const BoxDecoration(
          color: Color(0xff2566cf),
          borderRadius: BorderRadius.all(
            Radius.circular(22),
          ),
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              vm.result.toString(),
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
