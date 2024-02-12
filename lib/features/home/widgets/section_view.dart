import 'package:flutter/material.dart';
import 'package:marketmate/app/utils/color_extension.dart';

class SectionView extends StatelessWidget {
  final String title;
  final bool isShowSeeAllButton;
  final VoidCallback onPressed;
  final EdgeInsets? padding;
  const SectionView({super.key, required this.title, this.isShowSeeAllButton=true, required this.onPressed, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            Text(title,style: TextStyle(color: Tcolor.darkGrey,fontSize: 20,fontWeight: FontWeight.w600),),

            TextButton(onPressed: onPressed, child: Text("See all",style: TextStyle(color: Tcolor.primary,fontSize: 16,fontWeight: FontWeight.w600),)),


        ],
      ),
    );
  }
}