import 'package:flutter/material.dart';
import 'package:marketmate/common/color_extension.dart';
import 'package:marketmate/common_widgets/dropdown.dart';

import 'package:marketmate/common_widgets/roundbutton.dart';
import 'package:marketmate/login/login_view.dart';

class SelectLocationView extends StatefulWidget {
  const SelectLocationView({super.key});

  @override
  State<SelectLocationView> createState() => _SelectLocationViewState();
}

class _SelectLocationViewState extends State<SelectLocationView> {
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [ 
                Image.asset("assets/images/illustration.png",width: media.width*0.6,),
                SizedBox(height: media.width*0.1,),
                
                Text("Select your location",style: 
                  TextStyle(fontSize: 26,fontWeight: FontWeight.w600,
                  color: Tcolor.primaryText)),
                   SizedBox(height: media.width*0.03,),

                  Text("Switch on your location to stay in tune with\nwhat’s happening in your area",
                  textAlign: TextAlign.center,
                  style: 
                  TextStyle(fontSize: 16,fontWeight: FontWeight.w600,
                  color: Tcolor.secondaryText)),

                SizedBox(height: media.width*0.1,),
                  DropDown(title: "your Zone", placeholder: "Select your zone", 
                  valueList: ["Perinthalmana","Vengoor"], didChange: (sObj){}),

                   SizedBox(height: media.width*0.07,),


                   DropDown(title: "your Area", placeholder: "Select your Area", 
                  valueList: ["ponniakurussi","Kariyavattom"], didChange: (sObj){}),
                  SizedBox(height: media.width*0.1,),
                  RoundButton(title:"Submit", onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder:  (context) => const LoginView()));

                  })



                
                
                


                  
                  
                 
                  ],
                )

               
              
          ),
        ),
      ) ,
      
    )],
    );
    
    
    
   
  }
}

