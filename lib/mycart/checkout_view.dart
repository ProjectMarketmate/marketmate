import 'package:flutter/material.dart';
import 'package:marketmate/common/color_extension.dart';
import 'package:marketmate/common_widgets/roundbutton.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)

      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Checkout",style: TextStyle(color: Tcolor.primaryText,fontSize: 20,fontWeight: FontWeight.w700),),
                //close button
                 InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                  
                                },
                                child: Icon(Icons.close,color: Tcolor.primaryText,size: 25,))
              ],
            ),
          ),


          RoundButton(title: "Place Order", onPressed: (){},),
        ],
      ),
    );
  }
}