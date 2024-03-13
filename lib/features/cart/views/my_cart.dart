import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketmate/app/utils/color_extension.dart';
import 'package:marketmate/features/cart/widgets/cart_item_row.dart';
import 'package:marketmate/features/cart/cubit/cart_cubit.dart';
import 'package:marketmate/features/cart/views/checkout_view.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  void initState() {
    context.read<CartCubit>().getCartItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.5,
        title: Text(
          "My Cart",
          style: TextStyle(
              color: Tcolor.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
      backgroundColor: Colors.white,
      body: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state.status == CartStatus.success) {
            print("updated");
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ListView.separated(
                  key: UniqueKey(),
                    padding: const EdgeInsets.all(20),
                    separatorBuilder: (context, index) => const Divider(
                          color: Colors.black26,
                          height: 1,
                        ), //divder at each list use in listview.seprated
                    itemCount: state.cartItems.length,
                    itemBuilder: (context, index) {
                      var pObj = state.cartItems[index];
                      return CartItemRow(
                        key: ValueKey(pObj.id!),
                        item: pObj,
                      );
                    }),

                // chechout button//////////////////////////////////////////
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          //bottomsheet pop up function
                          showcheckout();
                        },
                        height: 60,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19),
                        ),
                        minWidth: double.maxFinite,
                        elevation: 0.1,
                        color: Tcolor.primary,
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Go to Checkout",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 8),

                                //inside round button price tag
                                child: Text(
                                  "Rs.0",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ))
                          ],
                        ),
                      ),

                      //round Button end
                    ],
                  ),
                )
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  //bottom sheet pop up
  void showcheckout() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isDismissible: false,
        context: context,
        builder: (context) => const CheckoutView());
  }
}
