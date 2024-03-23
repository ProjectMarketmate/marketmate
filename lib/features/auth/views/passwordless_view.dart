import 'package:flutter/material.dart';

import 'package:marketmate/app/common/widgets/line_textfield.dart';

import 'package:marketmate/app/common/widgets/roundbutton.dart';
import 'package:marketmate/app/utils/color_extension.dart';
import 'package:marketmate/app/utils/context_extension.dart';
import 'package:marketmate/features/auth/views/verification_view.dart';

class PasswordLessView extends StatefulWidget {
  const PasswordLessView({super.key});

  @override
  State<PasswordLessView> createState() => _PasswordLessViewState();
}

class _PasswordLessViewState extends State<PasswordLessView> {
  @override
  Widget build(BuildContext context) {
    TextEditingController txtEmail = TextEditingController();

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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/otp.png",
                      ),
                      SizedBox(
                        height: media.width * 0.1,
                      ),
                      Text("Passwordless Sign In",
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                              color: Tcolor.primaryText)),
                      SizedBox(
                        height: media.width * 0.03,
                      ),
                      Text(
                          "Enter your Email address to receive a One-Time Password (OTP) for authentication",
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
                          placeholder: "Enter your Email",
                          title: "Email"),
                      SizedBox(
                        height: media.width * 0.07,
                      ),
                      RoundButton(
                          title: "Get OTP",
                          onPressed: () {
                            context.navigatePush(VerificationView());
                          })
                    ],
                  )),
            ),
          ),
        )
      ],
    );
  }
}
