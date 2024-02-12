import 'package:flutter/material.dart';
import 'package:marketmate/app/utils/color_extension.dart';

class FilterRow extends StatelessWidget {
  final Map fObj;
  final bool isSelect;
  final VoidCallback onPressed;
  const FilterRow({super.key, required this.fObj, required this.isSelect, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(children: [
                          Image.asset(isSelect ? "assets/images/check.png":"assets/images/Rectangle 75.png",width: 20,height: 25,),
                          const SizedBox(
                            width: 15,
                          ),
                           Expanded(
                             child: Text(fObj['name'],
                                        style: TextStyle(color:isSelect ? Tcolor.primary: Tcolor.primaryText,
                                        fontSize: 16,fontWeight: FontWeight.w500),),
                           )
                        ],),
                      ),
                    ),
    );
  }
}