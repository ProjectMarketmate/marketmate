import 'package:flutter/material.dart';
import 'package:marketmate/app/common/widgets/roundbutton.dart';
import 'package:marketmate/features/cart/models/cart_item.dart';
import 'package:marketmate/features/cart/views/my_cart.dart';
import 'package:marketmate/features/cart/widgets/cart_item_row.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
        backgroundColor: Color(0xff53B175),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              RoundButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyCart(),
                    ),
                  );
                },
                title: 'View Cart',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
