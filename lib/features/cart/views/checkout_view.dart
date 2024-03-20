import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketmate/app/utils/color_extension.dart';
import 'package:marketmate/app/common/widgets/roundbutton.dart';
import 'package:marketmate/app/utils/context_extension.dart';
import 'package:marketmate/app/utils/dio_client.dart';
import 'package:marketmate/features/cart/cubit/cart_cubit.dart';
import 'package:marketmate/features/cart/views/my_cart.dart';
import 'package:marketmate/features/cart/views/order_accepted.dart';
import 'package:marketmate/features/cart/views/order_failed_view.dart';
import 'package:marketmate/features/cart/widgets/checkout_item_row.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Checkout",
                  style: TextStyle(
                      color: Tcolor.primaryText,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                //close button
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: Tcolor.primaryText,
                      size: 25,
                    ))
              ],
            ),
          ),
          Divider(
            color: Colors.black26,
            height: 1,
          ),
          CheckoutItemRow(
              title: "Delivery", value: "Cash on Delivery", onPressed: () {}),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(
                color: Colors.black26,
                height: 1,
              ),
              CheckoutItemRow(
                  title: "Total Cost",
                  value: totalPrice.value.toString(),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                              backgroundColor: Colors.transparent,
                              insetPadding:
                                  EdgeInsets.symmetric(horizontal: 20),
                              child: OrderFailedView());
                        });
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                            color: Tcolor.secondaryText,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                        children: [
                          const TextSpan(
                              text: "By continuing, you agree to our "),
                          TextSpan(
                              text: "Terms",
                              style: TextStyle(
                                  color: Tcolor.primaryText,
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
                                  color: Tcolor.primaryText,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500)),
                        ],
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("Privacy Policy Click");
                          })),
              ),
            ],
          ),
          isLoading
              ? CircularProgressIndicator()
              : RoundButton(
                  title: "Place Order",
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    try {
                      final resp = await dioClient.post('/app/order/create/');
                      context.pop();
                      context.navigatePush(OrderAcceptView());
                      context.read<CartCubit>().getCartItems();
                    } catch (e) {
                      context.pop();
                      print(e);
                      context.showErrorMessage("Something went wrong");
                    } finally {
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                ),
        ],
      ),
    );
  }
}
