

import 'package:flutter/material.dart';
import 'package:marketmate/app/common/models/order/order.dart';
import 'package:marketmate/features/cart/widgets/cart_item_row.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({super.key, required this.order});
  final Order order;

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("Order ID: ${widget.order.id}"),
            Text("Order Date: ${widget.order.createdAt}"),
            Text("Status: ${widget.order.status}"),
            for(var item in widget.order.items!)
              ListTile(
                title: Text(item.product!.name!),
                subtitle: Text("Quantity: ${item.quantity}"),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(item.product!.thumbnail!),
                ),
              ),
          ],
        ),
      ),
    );
  }
}