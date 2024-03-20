import 'package:flutter/material.dart';
import 'package:marketmate/app/common/models/order/order.dart';
import 'package:marketmate/app/common/widgets/roundbutton.dart';
import 'package:marketmate/app/utils/context_extension.dart';
import 'package:marketmate/app/utils/dio_client.dart';
import 'package:marketmate/features/account/view/order_detail_screen.dart';
import 'package:marketmate/features/cart/models/cart_item.dart';
import 'package:marketmate/features/cart/views/my_cart.dart';
import 'package:marketmate/features/cart/widgets/cart_item_row.dart';

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

  void getOrders()async{
      try {
        final resp  = await dioClient.get('/app/order/');
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: isLoading? Center(child: CircularProgressIndicator(),):SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
             for (var order in orders) ListTile(
              title: Text("Order ID: ${order.id}"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Order Date: ${order.createdAt}"),
                  Chip(
                    label: Text("${order.status}",
                  style: TextStyle(
                    color: getStatusColor(order.status!)
                  ),
                  ),
                  backgroundColor: getStatusColor(order.status!).withOpacity(0.1),
                  ),
                ],
              ),

              trailing: Icon(Icons.arrow_forward_ios),
              onTap: (){
                  context.navigatePush(OrderDetailScreen(order: order));
              },
            ),

            ],
          ),
        ),
      ),
    );
  }

  Color getStatusColor(String status){
    switch (status) {
      case ORDER_STATUS.PENDING:
       return  Colors.orange;
       
      case ORDER_STATUS.DELIVERED:
       return Colors.green;
        break;
      case ORDER_STATUS.CANCELED:
       return Colors.red;
        break;
      case ORDER_STATUS.SHIPPED:
       return  Colors.grey;
        break;
      case ORDER_STATUS.PROCESSING:
       return  Colors.blue;
        break;
      default:
       return Colors.grey;
        break;
    }
  }
}
