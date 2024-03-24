import 'package:flutter/material.dart';
import 'package:marketmate/app/common/cubit/main_cubit.dart';
import 'package:marketmate/app/utils/color_extension.dart';

import 'package:marketmate/features/auth/cubit/auth_cubit.dart';
import 'package:marketmate/features/auth/cubit/signup/signup_cubit.dart';

import 'package:marketmate/app/common/views/splash_view.dart';
import 'package:marketmate/features/cart/cubit/addtocart/addtocart_cubit.dart';
import 'package:marketmate/features/cart/cubit/cart_cubit.dart';

import 'package:marketmate/features/explore/cubit/category/category_cubit.dart';
import 'package:marketmate/features/explore/cubit/cubit/searchcubit_cubit.dart';
import 'package:marketmate/features/explore/cubit/explore_cubit.dart';

import 'package:marketmate/features/home/cubit/home_view_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketmate/features/home/cubit/homebanner/homebanner_cubit.dart';
import 'package:marketmate/features/home/cubit/productcubit/productdetail_cubit.dart';

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
        BlocProvider(create: (ctx) => MainCubit()),
        BlocProvider(create: (ctx) => AddtocartCubit()),
        BlocProvider(create: (ctx) => ExploreCubit()),
        BlocProvider(create: (ctx) => CategoryCubit()),
        BlocProvider(create: (ctx) => SearchcubitCubit()),
        BlocProvider(create: (ctx) => HomeViewCubit()),
        BlocProvider(create: (ctx) => HomebannerCubit()),
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
