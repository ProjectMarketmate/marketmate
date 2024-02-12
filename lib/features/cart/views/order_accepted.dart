import 'package:flutter/material.dart';
import 'package:marketmate/app/utils/color_extension.dart';
import 'package:marketmate/common_widgets/roundbutton.dart';

class OrderAcceptView extends StatefulWidget {
  const OrderAcceptView({super.key});

  @override
  State<OrderAcceptView> createState() => _OrderAcceptViewState();
}

class _OrderAcceptViewState extends State<OrderAcceptView> {
  @override
  Widget build(BuildContext context) {
    var media =MediaQuery.sizeOf(context);
    return 
        Scaffold(
          backgroundColor: Colors.white,
          body: 
          Stack(
      children: [
        Image.asset("assets/images/Rectangle 17.png",
        width: media.width,height: media.height,
        fit: BoxFit.cover,),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Column(
                children: [
                  Spacer(),
            
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: Image.asset("assets/images/checkedmark.png",width: media.width*0.7,),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text("Your order has been\naccepted",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    
                    color: Tcolor.primaryText,
                    fontSize: 28,
                    fontWeight: FontWeight.w600
                  ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Your items has been placed and is on\nit way to being processed",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    
                    color: Tcolor.secondaryText,
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                  ),
                  ),
                  Spacer(),
                  Spacer(),
                  RoundButton(title: "Track Order", onPressed: (){}),
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                  }, 
                  child: Text("Back to Home",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    
                    color: Tcolor.primaryText,
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                  ),
                  )
                  )
                ],
              ),
          ),
        ),
        
      ],)
    );
  }
}