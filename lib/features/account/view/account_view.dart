import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketmate/features/account/widgets/account_row.dart';
import 'package:marketmate/app/utils/color_extension.dart';
import 'package:marketmate/features/auth/cubit/auth_cubit.dart';
import 'package:marketmate/features/auth/views/login_view.dart';
import 'package:marketmate/features/cart/views/checkout_view.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
    final user = (context.read<AuthCubit>().state as AuthSuccess).user;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage("assets/images/useraccount.png"),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${user.firstName} ${user.lastName}",
                                  style: TextStyle(
                                      color: Tcolor.primaryText,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                // IconButton(
                                //     onPressed: () {},
                                //     icon: Icon(
                                //       Icons.edit,
                                //       color: Tcolor.primary,
                                //       size: 20,
                                //     ))
                              ],
                            ),
                            Text(
                              "${user.email}",
                              style: TextStyle(
                                  color: Tcolor.secondaryText,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  color: Colors.black26,
                  height: 1,
                ),
                // AccountRow(
                //     title: "Orders",
                //     icon: "assets/icons/Orders icon.png",
                //     onPressed: () {}),
                AccountRow(
                    title: "My Details",
                    icon: "assets/icons/My Details icon.png",
                    onPressed: () {}),
                // AccountRow(
                //     title: "Delivery",
                //     icon: "assets/icons/Delicery address.png",
                //     onPressed: () {}),
                // AccountRow(
                //     title: "Payment Methods",
                //     icon: "assets/icons/Vector icon.png",
                //     onPressed: () {}),
                AccountRow(
                    title: "Notifications",
                    icon: "assets/icons/Bell icon.png",
                    onPressed: () {}),
                AccountRow(
                    title: "Help",
                    icon: "assets/icons/help icon.png",
                    onPressed: () {}),
                AccountRow(
                    title: "About",
                    icon: "assets/icons/about icon.png",
                    onPressed: () {}),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.28,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
                  child: Column(
                    children: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginView()));

                          context.read<AuthCubit>().logout();
                        },
                        height: 60,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19),
                        ),
                        minWidth: double.maxFinite,
                        elevation: 0.1,
                        color: Color(0xffF2F3F2),
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Log Out",
                                  style: TextStyle(
                                      color: Tcolor.primary,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),

                                //inside round button price tag
                                child: Icon(
                                  Icons.logout,
                                  color: Tcolor.primary,
                                ))
                          ],
                        ),
                      ),

                      //round Button end
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
