import 'package:flutter/material.dart';
import 'package:marketmate/app/utils/color_extension.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const RoundButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 60,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(19),
      ),
      minWidth: double.maxFinite,
      elevation: 0.1,
      color: Tcolor.primary,
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final String title;
  final String icon;
  final Color bgcolor;
  final VoidCallback onPressed;
  const RoundIconButton(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.icon,
      required this.bgcolor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 60,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(19),
      ),
      minWidth: double.maxFinite,
      elevation: 0.1,
      color: bgcolor,
      child: Row(
        children: [
          Image.asset(
            icon,
            height: 20,
            width: 20,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
