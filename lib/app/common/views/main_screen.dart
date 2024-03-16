import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketmate/app/common/cubit/main_cubit.dart';
import 'package:marketmate/features/account/view/account_view.dart';
import 'package:marketmate/app/utils/color_extension.dart';
import 'package:marketmate/features/cart/cubit/addtocart/addtocart_cubit.dart';
import 'package:marketmate/features/cart/cubit/cart_cubit.dart';
import 'package:marketmate/features/explore/view/explore_view.dart';

import 'package:marketmate/features/cart/views/my_cart.dart';
import 'package:marketmate/features/home/views/home_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    context.read<CartCubit>().getCartItems();
    super.initState();
  }

  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  List<Widget> pages = [
    //pages navigate here
    const HomeView(),

    const ExploreView(),
    const MyCart(),

    AccountView()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, int>(
      builder: (context, state) {
        return Scaffold(
            body: pages[context.read<MainCubit>().state],
            bottomNavigationBar: NavigationBar(
              backgroundColor: Colors.white,
              onDestinationSelected: (value) {
                context.read<MainCubit>().changeIndex(value);
              },
              selectedIndex: state,
              destinations: [
                NavigationDestination(
                    icon: Icon(Icons.home_outlined), label: "Home"),
                NavigationDestination(
                    icon: Icon(Icons.explore_outlined), label: "Explore"),
                NavigationDestination(
                    icon: BlocListener<AddtocartCubit, AddtocartState>(
                      listener: (context, state) {
                       
                       if (state is AddtocartSuccess) {
                         context.read<CartCubit>().getCartItems();
                       }
                      },
                      child: BlocBuilder<CartCubit, CartState>(
                        builder: (context, state) {
                          return Stack(
                            children: [
                              state.status == CartStatus.loading ?
                               SizedBox(height: 10,
                               width: 10,
                                 child: const CircularProgressIndicator(
                                  
                                 ),
                               )
                               :Icon(Icons.shopping_cart_outlined),
                              if (state.status == CartStatus.success &&
                                  state.cartItems.length > 0)
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: Container(
                                    width: 10,
                                    height: 10,
                                    decoration: const BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle),
                                  ),
                                )
                            ],
                          );
                        },
                      ),
                    ),
                    label: "Cart"),
                NavigationDestination(
                    icon: Icon(Icons.account_circle_outlined),
                    label: "Account"),
              ],
            ));
      },
    );
  }
}
