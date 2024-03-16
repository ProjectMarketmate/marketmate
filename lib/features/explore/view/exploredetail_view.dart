import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketmate/app/utils/color_extension.dart';
import 'package:marketmate/app/utils/context_extension.dart';
import 'package:marketmate/features/explore/cubit/category/category_cubit.dart';
import 'package:marketmate/features/explore/models/product_category.dart';

import 'package:marketmate/features/home/widgets/product_card.dart';
import 'package:marketmate/features/explore/view/filter_view.dart';

class ExploreDetail extends StatefulWidget {
  final ProductCategory category;
  const ExploreDetail({
    super.key, required this.category,
  });

  @override
  State<ExploreDetail> createState() => _ExploreDetailState();
}

class _ExploreDetailState extends State<ExploreDetail> {

  @override
  void initState() {
    context.read<CategoryCubit>().getCategoryProduct(categoryId: widget.category.id!);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                "assets/images/back arrow.png",
                width: 20,
                height: 20,
              )),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FilterView()));
                },
                icon: Image.asset(
                  "assets/images/filter.png",
                  width: 20,
                  height: 20,
                )),
          ],
          title: Text(
            widget.category.name.toString(),
            style: TextStyle(
                color: Tcolor.primaryText,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
        ),
        body: BlocConsumer<CategoryCubit, CategoryState>(
          listener: (context, state) {
              if (state is CategoryFailed) {
                context.showErrorMessage(state.error);
              }
          },
          builder: (context, state) {
            if (state is CategorySuccess) {
              return GridView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 10),
                itemCount: state.products.length,
                itemBuilder: (context, index) {


                   return ProductCard(product: state.products[index],);
                });
            }
            return Center(
              child: CircularProgressIndicator(),
            );
            
          },
        ));
  }
}
