

import 'package:flutter/material.dart';

import 'package:marketmate/app/utils/color_extension.dart';
import 'package:marketmate/common_widgets/roundbutton.dart';
import 'package:marketmate/features/auth/views/login_view.dart';





class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {

  TextEditingController txtMobile = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
     var media =MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [Image.asset("assets/images/signincover.png",width: media.width,),
        SingleChildScrollView(child: SafeArea(child: Column(
          children: [

            SizedBox(height: media.width*1,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Get your groceries\nwith MarketMate",style: TextStyle(fontSize: 29,fontWeight: FontWeight.w600,color: Tcolor.primaryText)),
                ],
              ),
            ),
                    const SizedBox(height: 35),
                    Column(
                      children: [
                        Icon(
                                Icons.shopping_cart_checkout_outlined,
                                size: 80,
                                color: Tcolor.primaryText,
                              ),
                      ],
                    ),

                //     Padding(
                //       padding: const EdgeInsets.symmetric(horizontal: 20),
                //       child: Column(
                //         children: [
                //           TextField(
                //             controller: txtMobile,
                //             keyboardType: TextInputType.phone,
                //             decoration: InputDecoration(
                //               prefixIcon: Icon(Icons.phone,color: Tcolor.primaryText,),
                              
                //               border: InputBorder.none,
                //               enabledBorder: InputBorder.none,
                //               focusedBorder: InputBorder.none,
                //               hintText: "Mobile Number",
                //               hintStyle: TextStyle(fontSize: 17,color: Tcolor.placeholder),
                //             ),
                //           ),
                //           Container(width: double.maxFinite,height: 1,color:Tcolor.secondaryText,)
                //         ],
                //       ),
                //     ),
                //     const SizedBox(height: 25,),
                
           

                // Text("Or connect with social media",style: 
                // TextStyle(fontSize: 16,fontWeight: FontWeight.w600,
                // color: Tcolor.secondaryText)),
                    const SizedBox(height: 60),
                 Padding(
                  
             padding: const EdgeInsets.symmetric(horizontal: 20),
             child: RoundButton(title: "Get Started", onPressed:(){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginView()));
             }),
           ),
                const SizedBox(height: 15),
      
        //         Padding(
        //           padding: const EdgeInsets.symmetric(horizontal: 20),
        //           child: RoundIconButton(title: "Continue with Facebook", onPressed: (){}, icon:"assets/images/Vector.png" , bgcolor: Color(0xff4A66AC)),

        // )
        ],
        )
        ),)

        ],
      ),
    );

  }
}

