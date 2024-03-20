import 'package:flutter/material.dart';
import 'package:marketmate/app/utils/color_extension.dart';

class CheckoutItemRow extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback onPressed;
  const CheckoutItemRow(
      {super.key,
      required this.title,
      required this.value,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Tcolor.secondaryText,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                Expanded(
                  child: Text(
                    value,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        color: Tcolor.primaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                
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
