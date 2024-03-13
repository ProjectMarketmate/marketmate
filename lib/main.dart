import 'package:flutter/material.dart';
import 'package:marketmate/app/utils/color_extension.dart';

import 'package:marketmate/features/auth/cubit/auth_cubit.dart';
import 'package:marketmate/features/auth/cubit/signup/signup_cubit.dart';

import 'package:marketmate/app/common/views/splash_view.dart';
import 'package:marketmate/features/cart/cubit/cart_cubit.dart';
import 'package:marketmate/features/home/cubit/cubit/productdetail_cubit.dart';

import 'package:marketmate/features/home/cubit/home_view_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => HomeViewCubit()),
        BlocProvider(create: (ctx) => AuthCubit()),
        BlocProvider(create: (ctx) => SignupCubit()),
        BlocProvider(create: (ctx) => SignupCubit()),
        BlocProvider(create: (ctx) => ProductdetailCubit()),
        BlocProvider(create: (ctx) => CartCubit()),
      ],
      child: MaterialApp(
          title: 'Online Groceries',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Tcolor.primary),
            useMaterial3: false,
          ),
          darkTheme: ThemeData.dark(
            useMaterial3: false,
          ),
          themeMode: ThemeMode.light,
          home: const SplashView()),
    );
  }
}
