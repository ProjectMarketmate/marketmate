import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketmate/app/utils/color_extension.dart';
import 'package:marketmate/app/utils/context_extension.dart';
import 'package:marketmate/features/cart/cubit/addtocart/addtocart_cubit.dart';
import 'package:marketmate/features/cart/cubit/cart_cubit.dart';
import 'package:marketmate/features/home/views/Product_details_view.dart';

import '../../../app/common/models/products.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final Product product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                ProductDetails(
              product: product,
            ),
            transitionDuration: Duration(milliseconds: 600),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.ease;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          ),
        );
      },
      child: Container(
        width: 190,
        margin: EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: Tcolor.placeholder.withOpacity(0.5), width: 1),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                    tag: product.id!,
                    child: Image.network(
                      product.thumbnail ?? "",
                      width: 100,
                      height: 80,
                      fit: BoxFit.contain,
                    )),
              ],
            ),
            const Spacer(),
            Text(
  product.name ?? "",
  style: TextStyle(
    color: Tcolor.primaryText,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  ),
  maxLines: 2, // Limiting to 2 lines, adjust as needed
  overflow: TextOverflow.ellipsis, // Truncate with ellipsis if overflow
),
            // Text(
            //   product.name ?? "",
            //   style: TextStyle(
            //       color: Tcolor.primaryText,
            //       fontSize: 16,
            //       fontWeight: FontWeight.w700),
            // ),
            const SizedBox(
              height: 2,
            ),
            const Spacer(),
            Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Expanded(
      // Wrap with Expanded to allow the text to take available space
      child: Text(
        "Rs.${product.mrp}",
        style: TextStyle(
          color: Tcolor.primaryText,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        overflow: TextOverflow.fade, // Handle overflow with ellipsis if necessary
      ),
    ),
    InkWell(
      onTap: () {
        context
            .read<AddtocartCubit>()
            .addtocart(productId: product.id!, quantity: 1);
        context.showMessage("Added to cart");
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Tcolor.primary,
          borderRadius: BorderRadius.circular(15),
        ),
        alignment: Alignment.center,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
    )
  ],
)
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
            //   children: [
            //     Text(
            //       "Rs.${product.mrp}",
            //       style: TextStyle(
            //           color: Tcolor.primaryText,
            //           fontSize: 18,
            //           fontWeight: FontWeight.w600),
            //           overflow: TextOverflow.ellipsis,
                      
            //     ),
               
            //     InkWell(
            //       onTap: () {
            //         context
            //             .read<AddtocartCubit>()
            //             .addtocart(productId: product.id!, quantity: 1);
            //         context.showMessage("Added to cart");
                    
            //       },
            //       child: Container(
            //         width: 40,
            //         height: 40,
            //         decoration: BoxDecoration(
            //             color: Tcolor.primary,
            //             borderRadius: BorderRadius.circular(15)),
            //         alignment: Alignment.center,
            //         child: const Icon(
            //           Icons.add,
            //           color: Colors.white,
            //           size: 30,
            //         ),
            //       ),
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
