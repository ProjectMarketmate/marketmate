import 'package:flutter/material.dart';
import 'package:marketmate/app/utils/color_extension.dart';
import 'package:marketmate/features/common/views/welcomepage.dart';




class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  

  @override
  void initState() {
    
    super.initState();
    fireOpenApp();
  }

void fireOpenApp() async{
  await Future.delayed(const Duration(seconds: 3));
  startApp();
}
void startApp(){
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const SignInView()), (route) => false);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Tcolor.primary,
      body: const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.shopping_cart_checkout_outlined,size: 100,color: Colors.white,),
        SizedBox(height: 20,),
        Text("MARKETMATE",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),),
      ],
    ),
  ),
    );
  }
}








  
