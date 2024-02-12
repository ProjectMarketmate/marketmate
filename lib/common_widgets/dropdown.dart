import 'package:flutter/material.dart';
import 'package:marketmate/app/utils/color_extension.dart';

class DropDown extends StatelessWidget {
  final String title;
  final String placeholder;
  final List valueList;
  final Function(Object?) didChange;
  const DropDown({super.key, required this.title, required this.placeholder, required this.valueList, required this.didChange});

  @override
  Widget build(BuildContext context) {
    return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(title,style: 
                  TextStyle(fontSize: 16,fontWeight: FontWeight.w600,
                  color: Tcolor.textTittle)),
    SizedBox(
                    height: 55,
                    
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        icon: Icon(Icons.expand_more,color: Tcolor.textTittle,),
                        hint: Text(placeholder,style:TextStyle(
                          fontSize: 16,fontWeight: FontWeight.w600,
                          color: Tcolor.placeholder
                        )  ),
                        isExpanded: true,
                        
                        items: valueList.map((obj) {
                        return DropdownMenuItem(
                          value: obj, child: Text(obj.toString(),style: 
                                      TextStyle(fontSize: 16,fontWeight: FontWeight.w600,
                                      color: Tcolor.primaryText)),);
                      }).toList(), onChanged: didChange),
                    ),
                  ),
                   Container(
                    width: double.maxFinite,
                    height: 1,
                    color: Tcolor.secondaryText,
                  )
                  
                  
                  
                  ]);
  }
}