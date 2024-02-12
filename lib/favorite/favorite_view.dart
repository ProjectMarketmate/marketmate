import 'package:flutter/material.dart';
import 'package:marketmate/app/utils/color_extension.dart';
import 'package:marketmate/common_widgets/favorite_item_row.dart';
import 'package:marketmate/common_widgets/roundbutton.dart';


class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  List favoriteArr =[

{
  "name":"Bell Pepper Red",
  "icon":"assets/images/grocery_images/pepper.png",
  "qty":"1",
  "unit":"pcs, Prices",
  "price":"RS 35",
},
{
  "name":"Organic Banana",
  "icon":"assets/images/grocery_images/banana.png",
  "qty":"4",
  "unit":"pcs, Prices",
  "price":"RS 25",
},
{
  "name":"Diet Coke",
  "icon":"assets/images/beverages_images/diet_coke.png",
  "qty":"3",
  "unit":"ml, Price",
  "price":"Rs.25",
  
},

{
  "name":"Coca Cola",
  "icon":"assets/images/beverages_images/coca_cola.png",
  "qty":"1",
  "unit":"ml, Price",
  "price":"Rs.25",
  
},


{
  "name":"Pespsi",
  "icon":"assets/images/beverages_images/pepsi.png",
  "qty":"1",
  "unit":"ml, Price",
  "price":"Rs.25",
  
},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0.5,
      //pagetitle
      title: Text("Favorite",style: TextStyle(color: Tcolor.primaryText,fontSize: 20,fontWeight: FontWeight.w700),),
    ),
    backgroundColor: Colors.white,
    body: Stack(
      alignment: Alignment.bottomCenter,
      children: [
          ListView.separated(
            padding: const EdgeInsets.all(20),
            separatorBuilder: (context,index)=>const Divider(color: Colors.black26,height: 1,),//divder at each list use in listview.seprated
            itemCount: favoriteArr.length,
            itemBuilder: (context,index){
              var pObj = favoriteArr[index] as Map? ?? {};
              return FavoriteItemRow(pObj: pObj,);
            
          }),

// chechout button//////////////////////////////////////////
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RoundButton(title: "Add All To Cart", onPressed: (){})
              
              
             
            ],
          ),
        )
      ],
    ),
    
    );
  }
}