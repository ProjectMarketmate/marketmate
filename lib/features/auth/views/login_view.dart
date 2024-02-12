import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketmate/app/utils/color_extension.dart';

import 'package:marketmate/common_widgets/line_textfield.dart';

import 'package:marketmate/common_widgets/roundbutton.dart';
import 'package:marketmate/features/auth/cubit/auth_cubit.dart';


import 'package:marketmate/features/auth/views/sign_up_view.dart';
import 'package:marketmate/features/common/views/main_tabview.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController txtEmail = TextEditingController(text:"admin@test.com");
  TextEditingController txtPassword = TextEditingController(text:"1234");
  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        Container(
            color: Colors.white,
            child: Image.asset(
              "assets/images/Rectangle 17.png",
              width: media.width,
              height: media.height,
              fit: BoxFit.cover,
            )),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset(
                  "assets/images/Frame.png",
                  width: 20,
                  height: 20,
                )),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart_checkout_outlined,
                            size: 50,
                            color: Tcolor.primary,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: media.width * 0.15,
                      ),
                      Text("Login",
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                              color: Tcolor.primaryText)),
                      SizedBox(
                        height: media.width * 0.03,
                      ),
                      Text("Enter your email and password to login",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Tcolor.secondaryText)),
                      SizedBox(
                        height: media.width * 0.1,
                      ),
                      LineTextField(
                        controller: txtEmail,
                        placeholder: "Enter your email address",
                        title: "Email",
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: media.width * 0.07,
                      ),
                      LineTextField(
                        controller: txtPassword,
                        placeholder: "Enter your password",
                        title: "Password",
                        obscureText: isShow,
                        right: IconButton(
                            onPressed: () {
                              setState(() {
                                isShow = !isShow;
                              });
                            },
                            icon: Icon(
                              !isShow ? Icons.visibility_off : Icons.visibility,
                              color: Tcolor.textTittle,
                            )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    color: Tcolor.primaryText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: media.width * 0.1,
                      ),
                      BlocConsumer<AuthCubit, AuthState>(
                        
                        
        
                      listener: (context, state) {
                        if (state is AuthSuccess) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const MainTab()));
                        }

                        if (state is AuthFailed) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Login Failed"),
                          ));
                        }
                      },
                        builder: (context, state) {
                          if (state is AuthLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return RoundButton(
                              title: "Log In",
                              onPressed: () {
                               context.read<AuthCubit>().login(
                                 email: txtEmail.text,
                                 password: txtPassword.text,
                               );
                              });
                        },
                      ),
                      SizedBox(
                        height: media.width * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignupView()));
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Don't have an account? ",
                                    style: TextStyle(
                                        color: Tcolor.primaryText,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        color: Tcolor.primary,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ],
                  )),
            ),
          ),
        )
      ],
    );
  }
}
