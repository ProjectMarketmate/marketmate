import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketmate/app/utils/color_extension.dart';

import 'package:marketmate/app/common/widgets/line_textfield.dart';

import 'package:marketmate/app/common/widgets/roundbutton.dart';
import 'package:marketmate/features/auth/views/login_view.dart';

import '../cubit/signup/signup_cubit.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtFirstname = TextEditingController();
  TextEditingController txtLastname = TextEditingController();
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
                      SizedBox(
                        height: media.width * 0.01,
                      ),
                      Text("Sign Up",
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                              color: Tcolor.primaryText)),
                      SizedBox(
                        height: media.width * 0.03,
                      ),
                      Text("Enter your credentials to continue",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Tcolor.secondaryText)),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      LineTextField(
                        controller: txtFirstname,
                        placeholder: "Enter your First name",
                        title: "First name",
                        keyboardType: TextInputType.name,
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      LineTextField(
                        controller: txtLastname,
                        placeholder: "Enter your Last name",
                        title: "Last name",
                        keyboardType: TextInputType.name,
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      LineTextField(
                        controller: txtMobile,
                        placeholder: "Enter your Mobile Number",
                        title: "Mobile",
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      LineTextField(
                        controller: txtEmail,
                        placeholder: "Enter your email address",
                        title: "Email",
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: media.width * 0.05,
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
                      SizedBox(
                        height: media.width * 0.02,
                      ),
                      RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  color: Tcolor.secondaryText,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                              children: [
                                const TextSpan(
                                    text: "By continuing, you agree to our "),
                                TextSpan(
                                    text: "Terms of Service ",
                                    style: TextStyle(
                                        color: Tcolor.primary,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        print("Terms of Service Click");
                                      }),
                                const TextSpan(text: " and "),
                                TextSpan(
                                    text: "Privacy Policy",
                                    style: TextStyle(
                                        color: Tcolor.primary,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                              ],
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print("Privacy Policy Click");
                                })),
                      SizedBox(
                        height: media.width * 0.1,
                      ),
                      BlocConsumer<SignupCubit, SignupState>(
                        listener: (context, state) {
                          if (state is SignupFailed) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(state.error),
                              ),
                            );
                          }

                          if (state is SignupSuccess) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text("Signup Success, Please Login Now"),
                              ),
                            );
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginView()));
                          }
                        },
                        builder: (context, state) {
                          if (state is SignupLoading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return RoundButton(
                              title: "Sign Up",
                              onPressed: () {
                                context.read<SignupCubit>().signup(
                                      firstName: txtFirstname.text,
                                      lastname: txtLastname.text,
                                      mobile: txtMobile.text,
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
                                Navigator.pop(context);
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Already have an account?",
                                    style: TextStyle(
                                        color: Tcolor.primaryText,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Sign In",
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
