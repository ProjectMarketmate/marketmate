import 'package:flutter/material.dart';
import 'package:marketmate/app/utils/color_extension.dart';
import 'package:marketmate/app/common/widgets/roundbutton.dart';

class OrderFailed extends StatelessWidget {
  const OrderFailed({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Container(
      width: media.width * 0.9,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Image.asset(
            "assets/images/order_failed_image.png",
            width: media.width * 0.6,
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "Oops! Order Failed",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Tcolor.primaryText,
                fontSize: 28,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Something went wrong",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Tcolor.secondaryText,
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 40,
          ),
          RoundButton(title: "Please Try Again", onPressed: () {}),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Back to Home",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Tcolor.primaryText,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ))
        ],
      ),
    );
  }
}
