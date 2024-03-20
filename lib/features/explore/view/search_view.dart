import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketmate/app/utils/color_extension.dart';
import 'package:marketmate/app/utils/context_extension.dart';
import 'package:marketmate/features/explore/cubit/cubit/searchcubit_cubit.dart';
import 'package:marketmate/features/home/widgets/product_card.dart';

class SearchView extends StatefulWidget {
  const SearchView({
    super.key,
  });

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController txtSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Search Products",
          style: TextStyle(
              color: Tcolor.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              height: 45,
              decoration: BoxDecoration(
                  color: const Color(0xffF2F3F2),
                  borderRadius: BorderRadius.circular(15)),
              alignment: Alignment.center,
              child: TextField(
                controller: txtSearch,
                onChanged: (value) {
                  context.read<SearchcubitCubit>().searchProducts(value);
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Tcolor.primary,
                    size: 35,
                  ),
                  counterText: "",
                  border: InputBorder.none,
                  hintText: "Search Store",
                  helperStyle: TextStyle(
                      color: Tcolor.secondaryText,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Expanded(
              child: BlocConsumer<SearchcubitCubit, SearchcubitState>(
                listener: (context, state) {
                  if (state is SearchcubitFailed) {
                    context.showErrorMessage(state.error);
                  }
                },
                builder: (context, state) {
                  if (state is SearchcubitSuccess) {
                    return GridView.builder(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.75,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 10),
                        itemCount: state.productList.length,
                        itemBuilder: (context, index) {
                          return ProductCard(
                            product: state.productList[index],
                          );
                        });
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
