import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketmate/app/common/models/user.dart';
import 'package:marketmate/app/common/widgets/line_textfield.dart';
import 'package:marketmate/app/common/widgets/roundbutton.dart';
import 'package:marketmate/app/utils/color_extension.dart';
import 'package:marketmate/app/utils/context_extension.dart';
import 'package:marketmate/app/utils/dio_client.dart';
import 'package:marketmate/features/auth/cubit/auth_cubit.dart';

class MyDetailsScreen extends StatefulWidget {
  final User? user;

  MyDetailsScreen({Key? key, this.user}) : super(key: key);

  @override
  _MyDetailsScreenState createState() => _MyDetailsScreenState();
}

class _MyDetailsScreenState extends State<MyDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _mobileController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      _firstNameController.text = widget.user!.firstName;
      _lastNameController.text = widget.user!.lastName;
      _emailController.text = widget.user!.email;
      _mobileController.text = widget.user!.mobile;
      _addressController.text = widget.user!.address;
    }
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Details", style: TextStyle(fontSize: 20)),
        centerTitle: true,
        elevation: 0.5,
        backgroundColor: Color(0xff53B175),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Hero(
                  tag: 'account_image',
                  transitionOnUserGestures: true,
                  createRectTween: (begin, end) {
                    return MaterialRectCenterArcTween(begin: begin, end: end);
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage("assets/images/useraccount.png"),
                  ),
                ),
                LineTextField(
                  controller: _firstNameController,
                  placeholder: "Enter your first name",
                  title: "First name",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                LineTextField(
                  controller: _lastNameController,
                  placeholder: "Enter your last name",
                  title: "Last Name",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                LineTextField(
                  controller: _addressController,
                  placeholder: "Enter your adress",
                  title: "Adress",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your adress';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                LineTextField(
                  controller: _emailController,
                  placeholder: "Enter your email",
                  title: "Email",
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                LineTextField(
                  controller: _mobileController,
                  placeholder: "Enter your mobile number",
                  title: "Mobile",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your mobile number';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                isLoading
                    ? CircularProgressIndicator()
                    : RoundButton(
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });

                          try {
                            final resp = await dioClient
                                .patch('/account/profile/', data: {
                              "first_name": _firstNameController.text,
                              "last_name": _lastNameController.text,
                              "email": _emailController.text,
                              "address": _addressController.text,
                              "mobile": _mobileController.text
                            });
                            _showSaveSuccessPopup(
                                context, User.fromJson(resp.data));
                          } catch (e) {
                            print(e);
                            context.showErrorMessage("Failed to update");
                          }
                          setState(() {
                            isLoading = false;
                          });
                        },
                        title: 'Save',
                      ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  void _showSaveSuccessPopup(BuildContext context, User user) {
    showDialog(
      barrierDismissible: true,
      useSafeArea: true,
      barrierColor: Colors.black.withOpacity(0.5),
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Success!'),
        content: Text('Your details have been saved.'),
        actions: [
          TextButton(
            onPressed: () {
              context.read<AuthCubit>().setUser(user);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
