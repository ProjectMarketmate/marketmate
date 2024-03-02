import 'package:flutter/material.dart';
import 'package:marketmate/app/utils/color_extension.dart';
import 'package:marketmate/features/home/views/Product_details_view.dart';

import '../../common/models/products.dart';

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
        width: 180,
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
                    tag: product.id,
                    child: Image.network(
                      product.thumbnail,
                      width: 100,
                      height: 80,
                      fit: BoxFit.contain,
                    )),
              ],
            ),
            const Spacer(),
            Text(
              product.name,
              style: TextStyle(
                  color: Tcolor.primaryText,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 2,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rs.${product.mrp}",
                  style: TextStyle(
                      color: Tcolor.primaryText,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Tcolor.primary,
                        borderRadius: BorderRadius.circular(15)),
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
          ],
        ),
      ),
    );
  }
}
