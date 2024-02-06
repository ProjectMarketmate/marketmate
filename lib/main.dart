import 'package:flutter/material.dart';
import 'package:marketmate/common/color_extension.dart';
import 'package:marketmate/login/splash_view.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Groceries',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Tcolor.primary),
        useMaterial3: false,
      ),
      home: const SplashView()
    );
  }
}

