import 'package:flutter/material.dart';
import 'package:marketmate/app/utils/color_extension.dart';
import 'package:marketmate/features/explore/models/product_category.dart';

class ExploreCard extends StatelessWidget {
  final ProductCategory category;
  final Color color;
  final VoidCallback onPressed;

  ExploreCard({
    super.key,
    required this.category,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: color.withOpacity(0.25),
            border: Border.all(color: color.withOpacity(0.5), width: 1),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  category.image ?? "",
                  width: 135,
                  height: 105,
                  fit: BoxFit.contain,
                ),
              ],
            ),
            const Spacer(),
            Center(
              child: Text(
                category.name ?? "",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Tcolor.primaryText,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
