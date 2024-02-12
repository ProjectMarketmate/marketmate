import 'package:flutter/material.dart';
import 'package:marketmate/account/view/account_view.dart';
import 'package:marketmate/app/utils/color_extension.dart';
import 'package:marketmate/explore/explore_view.dart';
import 'package:marketmate/favorite/favorite_view.dart';
import 'package:marketmate/features/cart/views/my_cart.dart';
import 'package:marketmate/features/home/views/home_view.dart';


class MainTab extends StatefulWidget {
  const MainTab({super.key});

  @override
  State<MainTab> createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> with SingleTickerProviderStateMixin {

  TabController? controller;
  int selectTab =0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=TabController(length: 5, vsync: this);
    controller?.addListener(() {
selectTab=controller!.index?? 0;

     });
  }

  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: [


          //pages navigate here
          const HomeView(),

          const ExploreView(),
           const MyCart(),
            const FavoriteView(),
            AccountView()
             

        ]),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: Colors.white,

        borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15),),
        boxShadow: [ BoxShadow(
          color: Colors.black26,
          blurRadius: 3,
          offset: Offset(0, -2)
        ),]
        
        
        ),
        child: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: TabBar(
            onTap: (value){
              setState(() {
                selectTab = value;
              });
            },
            controller: controller,
            indicatorColor: Colors.transparent,
            indicatorWeight: 1,
            labelColor: Tcolor.primary,
            unselectedLabelColor: Tcolor.primaryText,
            labelStyle: TextStyle(
              color: Tcolor.primaryText,
              fontSize: 12,
              fontWeight: FontWeight.w600
            ),
            unselectedLabelStyle: TextStyle(
              color: Tcolor.primary,
              fontSize: 12,
              fontWeight: FontWeight.w600
            ),
            
            tabs: [
              // bottom navigate bar buttons
            Tab(text: "Shop"    ,icon: Icon(Icons.home,color: selectTab == 0 ? Tcolor.primary : Tcolor.primaryText,)),
            Tab(text: "Explore"    ,icon: Icon(Icons.search,color: selectTab == 1 ? Tcolor.primary : Tcolor.primaryText)),
            Tab(text: "Cart"    ,icon: Icon(Icons.shopping_cart,color: selectTab == 2 ? Tcolor.primary : Tcolor.primaryText)),
            Tab(text: "Favorite"    ,icon: Icon(Icons.favorite,color: selectTab == 3 ? Tcolor.primary : Tcolor.primaryText)),
            Tab(text: "Account"    ,icon: Icon(Icons.person,color: selectTab == 4 ? Tcolor.primary : Tcolor.primaryText)),
            
          ]),
        ),
      ),
    );
  }
}