import 'package:flutter/material.dart';
import 'package:marketmate/app/common/models/order/order.dart';

import 'package:marketmate/app/utils/context_extension.dart';
import 'package:marketmate/app/utils/dio_client.dart';
import 'package:marketmate/features/account/view/order_detail_screen.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List<Order> orders = [];
  bool isLoading = true;

  @override
  void initState() {
    getOrders();
    super.initState();
  }

  void getOrders() async {
    setState(() {
      isLoading = true;
    });
    try {
      final resp = await dioClient.get('/app/order/');
      orders = [for (var item in resp.data) Order.fromJson(item)];
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
      context.showErrorMessage("Something went wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
        backgroundColor: Color(0xff53B175),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: () async {
                  getOrders();
                },
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      for (var order in orders.reversed.take(20))
                        ListTile(
                          title: Text("Order ID: ${order.id}"),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Order Date: ${order.createdAt}"),
                              Chip(
                                label: Text(
                                  "${order.status}",
                                  style: TextStyle(
                                      color: getStatusColor(order.status!)),
                                ),
                                backgroundColor: getStatusColor(order.status!)
                                    .withOpacity(0.1),
                              ),
                            ],
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            context.navigatePush(OrderDetailScreen(
                              order: order,
                              getOrders: getOrders,
                            ));
                          },
                        ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Color getStatusColor(String status) {
    switch (status) {
      case ORDER_STATUS.PENDING:
        return Colors.orange;

      case ORDER_STATUS.DELIVERED:
        return Colors.green;

      case ORDER_STATUS.CANCELED:
        return Colors.red;

      case ORDER_STATUS.SHIPPED:
        return Colors.grey;

      case ORDER_STATUS.PROCESSING:
        return Colors.blue;

      default:
        return Colors.grey;
    }
  }
}
