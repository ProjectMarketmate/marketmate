import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketmate/app/utils/color_extension.dart';
import 'package:marketmate/features/home/cubit/homebanner/homebanner_cubit.dart';

import 'package:marketmate/features/home/widgets/product_card.dart';

import 'package:marketmate/features/home/widgets/section_view.dart';

import 'package:marketmate/features/auth/cubit/auth_cubit.dart';
import 'package:marketmate/features/home/cubit/home_view_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  TextEditingController txtSearch = TextEditingController();

  @override
  void initState() {
    context.read<HomeViewCubit>().getProducts();
    context.read<HomebannerCubit>().getHomeBanner();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    final user = (context.read<AuthCubit>().state as AuthSuccess).user;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocConsumer<HomeViewCubit, HomeViewState>(
          listener: (context, state) {
            if (state is HomeViewFailed) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.error),
              ));
            }
          },
          builder: (context, state) {
            if (state is HomeViewSuccess) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<HomeViewCubit>().getProducts();
                },
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Hello ${user.firstName}',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: media.width * 0.01,
                      ),
                      if (user.isAdmin)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            height: 52,
                            decoration: BoxDecoration(
                                color: const Color(0xffF2F3F2),
                                borderRadius: BorderRadius.circular(15)),
                            alignment: Alignment.center,
                            child: TextField(
                              controller: txtSearch,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 16),
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
                        ),
                      SizedBox(
                        height: media.width * 0.03,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: BlocConsumer<HomebannerCubit, HomebannerState>(
                          listener: (context, state) {
                            
                          },
                          builder: (context, state) {
                           if (state is HomebannerSuccess) {
                            return CarouselSlider(
  options: CarouselOptions(height: 120.0,
  autoPlay: true, // Enable auto-scrolling
    autoPlayInterval: Duration(seconds: 3), // Set auto-scroll interval
    autoPlayAnimationDuration: Duration(milliseconds: 800), // Set animation duration
    autoPlayCurve: Curves.fastOutSlowIn, // Set animation curve
  
  ),
  
  items: state.banner.map((i) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
            color: Tcolor.primary.withAlpha(80),
            borderRadius: BorderRadius.circular(10),
            boxShadow:  [BoxShadow(
              color: Color.fromARGB(255, 81, 80, 80),
              blurRadius: 100,
              offset: Offset(0, 130),
              spreadRadius: 2,
              blurStyle: BlurStyle.inner
            )]
          ),
          child:  Stack(
            children: [
              Row(
                children: [
                  Image.network(i.image??"", fit: BoxFit.fill),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          i.title??'',
                          style: TextStyle(
                              color: Tcolor.primaryText,
                              fontSize: 20,
                              fontWeight: FontWeight.w500)),
                              SizedBox(
                                height: 5,
                              ),
                        Text(
                          i.description??'',
                          style: TextStyle(
                              color: Color.fromARGB(255, 81, 80, 80),
                              fontSize: 17,
                              fontWeight: FontWeight.w300)),
                              
                ],
              ),

              )
              ],
            ),
            ]));
      },
    );
  }).toList(),
);
                           }
                           return Center(
                             child: CircularProgressIndicator(),
                           );
                          },
                        ),
                      ),
                      SectionView(
                        title: "Exclusive Offers",
                        onPressed: () {
                          //   GridView.builder(
                          // padding: const EdgeInsets.symmetric(
                          //   vertical: 15,
                          // ),
                          // gridDelegate:
                          //     const SliverGridDelegateWithFixedCrossAxisCount(
                          //         crossAxisCount: 2,
                          //         childAspectRatio: 0.75,
                          //         crossAxisSpacing: 8,
                          //         mainAxisSpacing: 10),
                          // itemCount: state.products.length,
                          // itemBuilder: (context, index) {
                          //   return ProductCard(
                          //     product: state.products[index],
                          //   );
                          // });
                        },
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                      ),
                      SizedBox(
                        height: 230,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            itemCount: state.products.length,
                            itemBuilder: (context, index) {
                              return ProductCard(
                                product: state.products[index],
                              );
                            }),
                      ),
                      SectionView(
                        title: "Best Selling",
                        onPressed: () {},
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                      ),
                      SizedBox(
                        height: 230,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            itemCount: state.products.length,
                            itemBuilder: (context, index) {
                              return ProductCard(
                                product: state.products[index],
                              );
                            }),
                      ),
                      // SizedBox(
                      //   height: 230,
                      //   child: ListView.builder(
                      //       scrollDirection: Axis.horizontal,
                      //       padding: const EdgeInsets.symmetric(horizontal: 15),
                      //       itemCount: bestSellingArr.length,
                      //       itemBuilder: (context, index) {
                      //         var pObj = bestSellingArr[index] as Map? ?? {};
                      //         return ProductCard(
                      //           pObj: pObj,
                      //           onPressed: () {
                      //             Navigator.push(
                      //                 context,
                      //                 MaterialPageRoute(
                      //                     builder: (context) =>
                      //                         const ProductDetails()));
                      //           },
                      //           onCart: () {},
                      //         );
                      //       }),
                      // ),
                      // SectionView(
                      //   title: "Groceries",
                      //   onPressed: () {},
                      //   padding:
                      //       const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      // ),
                      // SizedBox(
                      //   height: 110,
                      //   child: ListView.builder(
                      //       scrollDirection: Axis.horizontal,
                      //       padding: const EdgeInsets.symmetric(horizontal: 15),
                      //       itemCount: groceriesArr.length,
                      //       itemBuilder: (context, index) {
                      //         var pObj = groceriesArr[index] as Map? ?? {};
                      //         return CategoryCard(pObj: pObj, onPressed: () {});
                      //       }),
                      // ),
                      // const SizedBox(
                      //   height: 15,
                      // ),
                      // SizedBox(
                      //   height: 230,
                      //   child: ListView.builder(
                      //       scrollDirection: Axis.horizontal,
                      //       padding: const EdgeInsets.symmetric(horizontal: 15),
                      //       itemCount: listArr.length,
                      //       itemBuilder: (context, index) {
                      //         var pObj = listArr[index] as Map? ?? {};
                      //         return ProductCard(
                      //           pObj: pObj,
                      //           onPressed: () {
                      //             Navigator.push(
                      //                 context,
                      //                 MaterialPageRoute(
                      //                     builder: (context) =>
                      //                         const ProductDetails()));
                      //           },
                      //           onCart: () {},
                      //         );
                      //       }),
                      // ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
