import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:marketmate/app/utils/color_extension.dart';
import 'package:marketmate/app/common/widgets/roundbutton.dart';
import 'package:marketmate/features/cart/views/order_accepted.dart';
import 'package:marketmate/features/cart/views/order_failed.dart';
import 'package:marketmate/features/cart/widgets/checkout_item_row.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
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
              title: "Delivery", value: "Select Method", onPressed: () {}),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  children: [
                    Text(
                      "Payment",
                      style: TextStyle(
                          color: Tcolor.secondaryText,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    Icon(
                      Icons.payment,
                      color: Tcolor.primary,
                      size: 23,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 17,
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.black26,
                height: 1,
              ),
              CheckoutItemRow(
                  title: "Total Cost",
                  value: "Rs.80",
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                              backgroundColor: Colors.transparent,
                              insetPadding:
                                  EdgeInsets.symmetric(horizontal: 20),
                              child: OrderFailed());
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
          RoundButton(
            title: "Place Order",
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OrderAcceptView()));
            },
          ),
        ],
      ),
    );
  }
}
