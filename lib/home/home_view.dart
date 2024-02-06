import 'package:flutter/material.dart';
import 'package:marketmate/common/color_extension.dart';
import 'package:marketmate/common_widgets/category_card.dart';

import 'package:marketmate/common_widgets/product_card.dart';

import 'package:marketmate/common_widgets/section_view.dart';
import 'package:marketmate/home/Product_details_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
   TextEditingController txtSearch =TextEditingController();
  
List exclusiveOfferArr =[
{
  "name":"Organic Banana",
  "icon":"assets/images/grocery_images/banana.png",
  "qty":"7",
  "unit":"pcs, Prices",
  "price":"RS 25",
},
{
  "name":"Red Apple",
  "icon":"assets/images/grocery_images/apple.png",
  "qty":"1",
  "unit":"pcs, Prices",
  "price":"RS 80",
},


];
List bestSellingArr =[
{
  "name":"Bell Pepper Red",
  "icon":"assets/images/grocery_images/pepper.png",
  "qty":"1",
  "unit":"pcs, Prices",
  "price":"RS 35",
},
{
  "name":"Ginger",
  "icon":"assets/images/grocery_images/ginger.png",
  "qty":"250",
  "unit":"pcs, Prices",
  "price":"RS 10",
},];

List groceriesArr =[
{
  "name":"Pulses",
  "icon":"assets/images/pulses.png",
  "color": const Color(0xffF8A44C),

},
{
  "name":"Rice",
  "icon":"assets/images/Rice.png",
  "color": const Color(0xff53B175),
},

];

List listArr =[
{
  "name":"Beef",
  "icon":"assets/images/grocery_images/beef.png",
  "qty":"1",
  "unit":"pcs, Prices",
  "price":"RS 150",
},
{
  "name":"Broiler Chicken",
  "icon":"assets/images/grocery_images/chicken.png",
  "qty":"1",
  "unit":"pcs, Prices",
  "price":"RS 110",
},];



  @override
  Widget build(BuildContext context) {
    var media =MediaQuery.sizeOf(context);
    return  
           Scaffold(backgroundColor: Colors.white,
   
      
      
      body:SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 52,
                  decoration: BoxDecoration(
                    color: const Color(0xffF2F3F2),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  alignment: Alignment.center,
                  child: TextField(
                    controller: txtSearch,
                    
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      prefixIcon:Icon(Icons.search,color: Tcolor.primary,size: 35,), 
                      counterText: "",
                      border: InputBorder.none,
                      hintText: "Search Store",helperStyle: TextStyle(color: Tcolor.secondaryText,fontSize: 14,fontWeight: FontWeight.w600),
                      
                  ),),
                ),
              ),
                 SizedBox(height: media.width*0.03,),
                 Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.maxFinite,
                  height: 115,
                  decoration: BoxDecoration(
                    color: const Color(0xffF2F3F2),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  alignment: Alignment.center,
                  child: Stack(children:[ Image.asset("assets/images/banner_background.png",fit: BoxFit.cover,),
                  Row(children: [
                    Image.asset("assets/images/banner_image.png"),
                    const SizedBox(width: 5,),
                    Image.asset("assets/images/Group 6811.png"),
                  ],)
                  ])
                ),
              ),
              SectionView(title: "Exclusive Offers", onPressed: (){},padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),),
              SizedBox(
                height: 230,
                
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: exclusiveOfferArr.length,
                  itemBuilder: (context,index){
                    var pObj = exclusiveOfferArr[index] as Map? ??{};
                    return ProductCard(pObj: pObj, onPressed: (){

                       Navigator.push(context, MaterialPageRoute(builder:  (context) => const ProductDetails()));

                    }, onCart: () {  },);
                  }),
              ),
              SectionView(title: "Best Selling", onPressed: (){
               
              },padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),),
              SizedBox(
                height: 230,
                
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: bestSellingArr.length,
                  itemBuilder: (context,index){
                    var pObj = bestSellingArr[index] as Map? ??{};
                    return ProductCard(pObj: pObj, onPressed: (){
                       Navigator.push(context, MaterialPageRoute(builder:  (context) => const ProductDetails()));

                    }, onCart: () {  },);
                  }),
              ),
              SectionView(title: "Groceries", onPressed: (){},padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 20),),
              SizedBox(
                height: 110,
                
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: groceriesArr.length,
                  itemBuilder: (context,index){
                    var pObj = groceriesArr[index] as Map? ??{};
                    return CategoryCard(pObj: pObj, onPressed: (){});
                  }),
              ),

              const SizedBox(height: 15,),
               SizedBox(
                height: 230,
                
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: listArr.length,
                  itemBuilder: (context,index){
                    var pObj = listArr[index] as Map? ??{};
                    return ProductCard(pObj: pObj, onPressed: (){
                       Navigator.push(context, MaterialPageRoute(builder:  (context) => const ProductDetails()));

                    }, onCart: () {  },);
                  }),
              ),
              const SizedBox(height: 15,),


                

              

              
              
              


                
                
               
                ],
              ),
        ),
      ) ,
      
   );
    
    
    
   
  }
}