import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/provider.dart';

class CustomGenderContainer extends StatefulWidget {
  const CustomGenderContainer(
      {Key? key,
      required this.iconData,
      required this.text,
      required this.onTap,
      this.color, this.iconColor, required this.borderColor})
      : super(key: key);
  final IconData iconData;
  final String text;
  final Function() onTap;
  final Color? color;
  final Color ? iconColor;
  final Color borderColor;

  @override
  State<CustomGenderContainer> createState() => _CustomGenderContainerState();
}

class _CustomGenderContainerState extends State<CustomGenderContainer> {
  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<BMIProvider>(context);

    return Expanded(
      child: GestureDetector(

        onTap: widget.onTap,
        child: Container(
          height: 140,
          decoration: BoxDecoration(
            color: widget.color ,
            border: Border.all(
              width: 2.5,
              color:widget.borderColor ,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.iconData,
                size: 100,
                color: widget.iconColor,
              ),
              Text(
                widget.text,
                style: const TextStyle(
                    fontFamily: 'inder',
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
