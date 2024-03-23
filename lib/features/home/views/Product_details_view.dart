import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:marketmate/app/common/cubit/main_cubit.dart';
import 'package:marketmate/app/common/views/main_screen.dart';
import 'package:marketmate/app/utils/color_extension.dart';

import 'package:marketmate/app/common/widgets/app_text.dart';
import 'package:marketmate/app/common/widgets/roundbutton.dart';
import 'package:marketmate/app/utils/common_utils.dart';
import 'package:marketmate/app/utils/context_extension.dart';
import 'package:marketmate/features/cart/cubit/addtocart/addtocart_cubit.dart';

import 'package:marketmate/features/home/widgets/itemcounterwidget.dart';

import '../../../app/common/models/products.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.product});
  final Product product;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int amount = 1;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: double.maxFinite,
            height: media.width * 0.8,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color(0xffF2F3F2),
                borderRadius: BorderRadius.circular(15)),
            child: Hero(
                tag: widget.product.id!,
                child: Image.network(widget.product.thumbnail ?? "")),
          ),
          SafeArea(
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Image.asset(
                    "assets/images/Frame.png",
                    width: 20,
                    height: 20,
                  )),
            ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.product.name ?? "",
                    style: TextStyle(
                        color: Tcolor.primaryText,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              // "qty${widget.product.stockAvailable}",
              widget.product.stockAvailable!
                  ? "Stock is available"
                  : "Stock is not available",
              style: TextStyle(
                  color: Tcolor.secondaryText,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 17,
            ),
            Row(
              children: [
                ItemCounterWidget(
                  onAmountChanged: (p0) {
                    setState(() {
                      amount = p0;
                    });
                  },
                ),
                Spacer(),
                Text(
                  "Rs.${widget.product.mrp}",
                  style: TextStyle(
                      color: Tcolor.primaryText,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(
              height: 17,
            ),
            const Divider(
              color: Colors.black26,
              height: 1,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Product Details",
                    style: TextStyle(
                        color: Tcolor.primaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_drop_down,
                      size: 30,
                    ))
              ],
            ),
            Text(
              widget.product.description ?? "",
              // "Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.",
              style: TextStyle(
                  color: Tcolor.secondaryText,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
              // overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              color: Colors.black26,
              height: 1,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Review",
                    style: TextStyle(
                        color: Tcolor.primaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                RatingBar.builder(
                  initialRating: 5,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 18,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Divider(
              color: Colors.black26,
              height: 1,
            ),
            const SizedBox(
              height: 20,
            ),
            BlocConsumer<AddtocartCubit, AddtocartState>(
              listener: (context, state) {
                if (state is AddtocartFailed) {
                  context.showMessage(state.error);
                }
                if (state is AddtocartSuccess) {
                  context.showMessage("Added to cart");
                  context.navigateReplaceAll(MainScreen());
                  context.read<MainCubit>().changeIndex(2);
                }
              },
              builder: (context, state) {
                if (state is AddtocartLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return RoundButton(
                    title: "Add To Basket",
                    onPressed: () {
                      context.read<AddtocartCubit>().addtocart(
                          productId: widget.product.id!, quantity: amount);
                    });
              },
            ),
          ],
        ),
      )
    ])));

    //   SafeArea(child:
    //    Column(
    //      children: [
    //        Container(

    //         width: double.infinity,
    //         height:MediaQuery.of(context).size.height *0.3,
    //          decoration: BoxDecoration(
    //            borderRadius: const BorderRadius.only(
    //           bottomLeft: Radius.circular(25),
    //           bottomRight: Radius.circular(25),
    //         ),
    //            gradient:  LinearGradient(
    //             colors: [
    //               const Color(0xFF3366FF).withOpacity(0.1),
    //               const Color(0xFF3366FF).withOpacity(0.09),
    //             ],
    //             begin: const FractionalOffset(0.0, 0.0),
    //             end: const FractionalOffset(0.0, 1.0),
    //          ),

    //   ),
    //        child: Image(
    //           image: AssetImage("assets/images/grocery_images/apple.png"),
    //         ),
    // ),

    // Expanded(
    //           child: Padding(
    //             padding: const EdgeInsets.symmetric(horizontal: 25),
    //             child: Column(
    //               children: [
    //                 ListTile(
    //                   contentPadding: EdgeInsets.zero,
    //                   title: Text(
    //                     "sss",
    //                     style: const TextStyle(
    //                         fontSize: 24, fontWeight: FontWeight.bold),
    //                   ),
    //                   subtitle: AppText(
    //                     text: "s",
    //                     fontSize: 16,
    //                     fontWeight: FontWeight.w600,
    //                     color: const Color(0xff7C7C7C),
    //                   ),
    //                   trailing: const Icon(Icons.favorite_border_outlined,)
    //                 ),

    //                  Row(
    //                   children: [
    //                     ItemCounterWidget(
    //                       onAmountChanged: (newAmount) {
    //                         setState(() {
    //                           amount = newAmount;
    //                         });
    //                       },
    //                     ),

    //                 const Spacer(),
    //                  Text(
    //                       "Rs.  ",
    //                       style: TextStyle(
    //                         fontSize: 24,
    //                         fontWeight: FontWeight.bold,
    //                       ),
    //                     )
    //               ]),

    //               const Divider(thickness: 1,),
    //               getProductDataRowWidget('Product Details'),
    //                const Divider(thickness: 1,),
    //               getProductDataRowWidget('Nutritions',customWidget: nutritionWidget()),
    //                const Divider(thickness: 1,),
    //               getProductDataRowWidget("Rating",customWidget: ratingWidget()),
    //                const Divider(thickness: 1,),
    //                const SizedBox(
    //                 height: 40,)
    //                 ,
    //                RoundButton(title: "Add to basket", onPressed: (){}),

    //   ]) ))],
    //    )
    // ));
  }
}

Widget getProductDataRowWidget(String label, {Widget? customWidget}) {
  return Container(
    margin: EdgeInsets.only(
      top: 20,
      bottom: 20,
    ),
    child: Row(
      children: [
        AppText(text: label, fontWeight: FontWeight.w600, fontSize: 16),
        Spacer(),
        if (customWidget != null) ...[
          customWidget,
          SizedBox(
            width: 20,
          )
        ],
        Icon(
          Icons.arrow_forward_ios,
          size: 20,
        )
      ],
    ),
  );
}

Widget nutritionWidget() {
  return Container(
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: Color(0xffEBEBEB),
      borderRadius: BorderRadius.circular(5),
    ),
    child: AppText(
      text: "100gm",
      fontWeight: FontWeight.w600,
      fontSize: 12,
      color: Color(0xff7C7C7C),
    ),
  );
}

Widget ratingWidget() {
  Widget starIcon() {
    return Icon(
      Icons.star,
      color: Color(0xffF3603F),
      size: 20,
    );
  }

  return Row(
    children: [
      starIcon(),
      starIcon(),
      starIcon(),
      starIcon(),
      starIcon(),
    ],
  );
}

//        Scaffold(backgroundColor: Colors.white,

//////////////////////////////////
