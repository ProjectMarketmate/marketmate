import 'package:flutter/material.dart';
import 'package:marketmate/app/utils/color_extension.dart';

class AccountRow extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onPressed;
  const AccountRow(
      {super.key,
      required this.title,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              children: [
                Image.asset(height: 15, color: Tcolor.primaryText, icon),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    title,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Tcolor.primaryText,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 17,
                )
              ],
            ),
          ),
        ),
        Divider(
          color: Colors.black26,
          height: 1,
        ),
      ],
    );
  }
}
