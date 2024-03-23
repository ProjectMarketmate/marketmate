import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketmate/app/utils/context_extension.dart';
import 'package:marketmate/features/account/view/help_screen.dart';
import 'package:marketmate/features/account/view/my_details_screen.dart';
import 'package:marketmate/features/account/view/notification_screen.dart';
import 'package:marketmate/features/account/view/orders_screen.dart';
import 'package:marketmate/features/account/widgets/account_row.dart';
import 'package:marketmate/app/utils/color_extension.dart';
import 'package:marketmate/features/auth/cubit/auth_cubit.dart';
import 'package:marketmate/features/auth/views/login_view.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    final user = context.select((AuthCubit c) => (c.state as AuthSuccess).user);
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
                      Hero(
                        tag: 'account_image',
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              AssetImage("assets/images/useraccount.png"),
                        ),
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
                AccountRow(
                  title: "My Details",
                  icon: "assets/icons/My Details icon.png",
                  onPressed: () {
                    context.navigatePush(
                      MyDetailsScreen(
                        user: user,
                      ),
                    );
                  },
                ),
                AccountRow(
                  title: "Orders",
                  icon: "assets/icons/Orders icon.png",
                  onPressed: () {
                    context.navigatePush(
                      OrdersScreen(),
                    );
                  },
                ),
                AccountRow(
                    title: "Notifications",
                    icon: "assets/icons/Bell icon.png",
                    onPressed: () {
                      context.navigatePush(
                        NotificationScreen(),
                      );
                    }),
                AccountRow(
                    title: "Help & Support",
                    icon: "assets/icons/help icon.png",
                    onPressed: () {
                      context.navigatePush(
                        HelpScreen(),
                      );
                    }),
                SizedBox(
                  height: media.height * 0.28,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    children: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginView()));

                          Future.delayed(
                            Duration(milliseconds: 500),
                            () {
                              context.read<AuthCubit>().logout();
                            },
                          );
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
