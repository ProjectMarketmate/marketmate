import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketmate/app/utils/color_extension.dart';
import 'package:marketmate/app/utils/context_extension.dart';
import 'package:marketmate/features/cart/cubit/cart_cubit.dart';
import 'package:marketmate/features/cart/cubit/deletefromcart/deletefromcart_cubit.dart';
import 'package:marketmate/features/cart/cubit/updatecart/updatecart_cubit.dart';
import 'package:marketmate/features/cart/models/cart_item.dart';

class CartItemRow extends StatefulWidget {
  final CartItem item;
  final VoidCallback onCountUpdate;
  final Key? key;
  const CartItemRow({
    required this.item,
    required this.onCountUpdate,
    this.key,
  });

  @override
  State<CartItemRow> createState() => _CartItemRowState();
}

class _CartItemRowState extends State<CartItemRow> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
      height: 110,
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //product image
              Image.network(
                widget.item.product?.thumbnail ?? "",
                width: 80,
                height: 65,
                fit: BoxFit.contain,
              ),
              SizedBox(
                width: 15,
              ),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        //product name
                        Expanded(
                            child: Text(
                          widget.item.product?.name ?? "",
                          style: TextStyle(
                              color: Tcolor.primaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                          overflow: TextOverflow.ellipsis,
                        )),
                        BlocConsumer<DeletefromcartCubit, DeletefromcartState>(
                          listener: (context, state) {
                            if (state is DeletefromcartSuccess) {
                              context.read<CartCubit>().removeProductFromList(
                                  productId: widget.item.product!.id!);
                            }
                            if (state is DeletefromcartFailed) {
                              context.showErrorMessage(state.error);
                            }
                          },
                          builder: (context, state) {
                            if (state is DeletefromcartLoading) {
                              return CircularProgressIndicator();
                            }
                            return InkWell(
                                onTap: () {
                                  context
                                      .read<DeletefromcartCubit>()
                                      .deletefromcart(
                                          cartItemId: widget.item.id!);
                                },
                                child: Icon(
                                  Icons.close,
                                  color: Tcolor.secondaryText,
                                  size: 30,
                                ));
                          },
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        //counter buttons start
                        BlocListener<DeletefromcartCubit, DeletefromcartState>(
                          listener: (context, state) {
                            if (state is DeletefromcartSuccess) {
                              widget.onCountUpdate();
                            }
                          },
                          child: BlocConsumer<UpdatecartCubit, UpdatecartState>(
                            listener: (context, state) {
                              if (state is UpdatecartSuccess) {
                                widget.onCountUpdate();
                              }
                              if (state is UpdatecartFailed) {
                                context.showErrorMessage(state.error);
                              }
                            },
                            builder: (context, state) {
                              if (state is UpdatecartLoading) {
                                return CircularProgressIndicator();
                              }
                              return Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () {
                                      if (widget.item.quantity == 1) {
                                        context
                                            .read<DeletefromcartCubit>()
                                            .deletefromcart(
                                                cartItemId: widget.item.id!);
                                      } else {
                                        context
                                            .read<UpdatecartCubit>()
                                            .updatecartItem(
                                              cartItemId: widget.item.id!,
                                              quantity:
                                                  widget.item.quantity! - 1,
                                            );
                                      }

                                      setState(() {
                                        if (widget.item.quantity! > 1) {
                                          widget.item.quantity =
                                              widget.item.quantity! - 1;
                                        }
                                      });

                                      widget.onCountUpdate();
                                    },
                                  ),
                                  SizedBox(width: 18),
                                  Container(
                                    width: 30,
                                    child: Center(
                                      child: Text(
                                        widget.item.quantity.toString(),
                                        style: TextStyle(
                                            color: Tcolor.primaryText,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 18),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      widget.onCountUpdate();
                                      context
                                          .read<UpdatecartCubit>()
                                          .updatecartItem(
                                            cartItemId: widget.item.id!,
                                            quantity: widget.item.quantity! + 1,
                                          );
                                      setState(() {
                                        widget.item.quantity =
                                            widget.item.quantity! + 1;
                                      });
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        ),

                        //counter button ends

                        const Spacer(),
                        Text(
                          (widget.item.quantity! *
                                  double.parse(widget.item.product!.mrp!))
                              .toString(),
                          style: TextStyle(
                              color: Tcolor.primaryText,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
