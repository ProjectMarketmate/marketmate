import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketmate/common_widgets/roundbutton.dart';

import 'sign_in_view.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {

@override
  void initState() {
    // TODO: implement initState
    
    SystemChrome.setEnabledSystemUIMode( SystemUiMode.leanBack);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media =MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [Image.asset("assets/images/welcome_image.png",width: media.width,height: media.height,fit: BoxFit.cover,),
      SafeArea(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
      
             Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("welcome \nto our store",style: GoogleFonts.roboto(fontSize: 48,fontWeight: FontWeight.w700,color: Colors.white),),
              ],
            ),
           const SizedBox(height: 20,),

           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20),
             child: RoundButton(title: "Get Start now", onPressed:(){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInView()));
             }),
           ),
           const SizedBox(height: 50,)

      
          ],
        ),
      )
      ]),

    );
  }
}