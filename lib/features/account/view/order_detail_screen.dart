



import 'package:flutter/material.dart';
import 'package:marketmate/app/common/models/order/order.dart';
import 'package:marketmate/app/common/widgets/roundbutton.dart';
import 'package:marketmate/app/utils/context_extension.dart';
import 'package:marketmate/app/utils/dio_client.dart';


class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({super.key, required this.order, required this.getOrders});
  final Order order;
  final VoidCallback getOrders;
  

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  bool isLoading =false;
  @override

void initState() {
  
  super.initState();
}

void cancelOrders()async{
  try {
    final resp  = await dioClient.patch('/app/order/${widget.order.id}/',data: {
      "status":ORDER_STATUS.CANCELED
    });
    
    setState(() {
      isLoading = true;
      
    });
    context.showMessage("Order ${widget.order.id} is Cancelled Successfully");
    widget.getOrders();
    context.pop();
  } catch (e) {
    print(e);
    context.showErrorMessage("Something went wrong");
  }
}

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Detail'),
         backgroundColor: Color(0xff53B175),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
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
            if(widget.order.status != ORDER_STATUS.CANCELED&&widget.order.status != ORDER_STATUS.DELIVERED)
             Positioned(
                    bottom: 25,left: 5,right: 5,
                    child: RoundButton(
                      title: "Cancel Order", onPressed: cancelOrders)),
                    
          ],
        ),
      ),
    );
  }
}