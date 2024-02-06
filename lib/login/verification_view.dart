import 'package:flutter/material.dart';
import 'package:marketmate/common/color_extension.dart';
import 'package:marketmate/common_widgets/line_textfield.dart';
import 'package:marketmate/login/select_location_view.dart';

class VerificationView extends StatefulWidget {
  const VerificationView({super.key});

  @override
  State<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  TextEditingController txtOTP =TextEditingController();



  @override
  Widget build(BuildContext context) {
    var media =MediaQuery.sizeOf(context);
    return  Stack(
      children: [
        Container(
          color: Colors.white,
          child: Image.asset("assets/images/Rectangle 17.png",width: media.width,height: media.height,fit: BoxFit.cover,)),
           Scaffold(backgroundColor: Colors.transparent,
    appBar: AppBar(backgroundColor: Colors.transparent,
    elevation: 0,
      leading: IconButton(onPressed: (){Navigator.pop(context);}, 
      icon:Image.asset("assets/images/Frame.png",width: 20,height: 20,) ),),
      
      
      body:SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ 
                SizedBox(width: media.width*0.1,),
                Text("Enter Your 4-digit code",style: 
                  TextStyle(fontSize: 26,fontWeight: FontWeight.w600,
                  color: Tcolor.primaryText)),

                const SizedBox(height: 20,),
                LineTextField(controller: txtOTP, placeholder: "_ _ _ _", title: "Code",maxLength: 4,),
                Container(height: 1,color: Tcolor.secondaryText,),
                SizedBox(height: media.width*0.3,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(onPressed: (){}, child: Text("Resend Code",style: 
                  TextStyle(fontSize: 18,fontWeight: FontWeight.w600,
                  color: Tcolor.primary)),),


                  InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder:  (context) => const SelectLocationView()));
                      
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Tcolor.primary,
                        borderRadius: BorderRadius.circular(30),
                        
                      ),
                      child: Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,),
                      
                    ),
                  )
                  
                 
                  ],
                )

               
              ]),
          ),
        ),
      ) ,
      )
      ],
    );
    
    
    
   
  }
}

