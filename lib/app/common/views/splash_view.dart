import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketmate/app/common/views/main_screen.dart';
import 'package:marketmate/app/utils/color_extension.dart';
import 'package:marketmate/app/common/views/welcomepage.dart';
import 'package:marketmate/app/utils/context_extension.dart';
import 'package:marketmate/features/auth/cubit/auth_cubit.dart';
import 'package:marketmate/features/auth/views/login_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().loadUser();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          context.navigateReplaceAll(MainScreen());
        }
        if (state is AuthInitial) {
          context.navigateReplaceAll(LoginView());
        }
      },
      child: Scaffold(
        backgroundColor: Tcolor.primary,
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_cart_checkout_outlined,
                size: 100,
                color: Colors.white,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "MARKETMATE",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
