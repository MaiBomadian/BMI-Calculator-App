import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {Key? key, required this.textButton, required this.onPressed, this.iconData})
      : super(key: key);
  final String textButton;
  final Function() onPressed;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          backgroundColor: const Color(0xff2566cf),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textButton,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Inder',
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8,),
            Icon(iconData,size: 26,color: Colors.white,),

          ],
        ),
      ),
    );
  }
}
