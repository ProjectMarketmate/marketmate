import 'package:flutter/material.dart';
import 'package:marketmate/app/utils/color_extension.dart';


import 'package:marketmate/explore/filter_view.dart';



class ExploreDetail extends StatefulWidget {
  final Map eObj;
  
  const ExploreDetail({super.key, required this.eObj,});

  @override
  State<ExploreDetail> createState() => _ExploreDetailState();
}

class _ExploreDetailState extends State<ExploreDetail> {
  List listArr =[
{
  "name":"Diet Coke",
  "icon":"assets/images/beverages_images/diet_coke.png",
  "qty":"355",
  "unit":"ml, Price",
  "price":"Rs.25",
  
},

{
  "name":"Coca Cola",
  "icon":"assets/images/beverages_images/coca_cola.png",
  "qty":"325",
  "unit":"ml, Price",
  "price":"Rs.25",
  
},

{
  "name":"Sprite",
  "icon":"assets/images/beverages_images/sprite.png",
  "qty":"325",
  "unit":"ml, Price",
  "price":"Rs.25",
  
},
{
  "name":"Apple & Grape Juice",
  "icon":"assets/images/beverages_images/apple_and_grape_juice.png",
  "qty":"2",
  "unit":"L, Price",
  "price":"Rs.90",
  
},
{
  "name":"Orange juice",
  "icon":"assets/images/beverages_images/orange_juice.png",
  "qty":"2",
  "unit":"L, Price",
  "price":"Rs.80",
  
},
{
  "name":"Pespsi",
  "icon":"assets/images/beverages_images/pepsi.png",
  "qty":"325",
  "unit":"ml, Price",
  "price":"Rs.25",
  
},


];

  @override
  Widget build(BuildContext context) {
   
    return  
           Scaffold(backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
            leading:  IconButton(onPressed: (){Navigator.pop(context);}, 
      icon:Image.asset("assets/images/back arrow.png",width: 20,height: 20,) ),
      actions: [ IconButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder:  (context) => const FilterView()));
      }, 
      icon:Image.asset("assets/images/filter.png",width: 20,height: 20,) ),],
            title: Text(widget.eObj['name'].toString(),style: TextStyle(color: Tcolor.primaryText,fontSize: 20,fontWeight: FontWeight.w700),),
          ),
      
      
      body:
          


          GridView.builder(
            
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
            childAspectRatio: 0.75,crossAxisSpacing: 15,mainAxisSpacing: 15),
            itemCount: listArr.length,
             itemBuilder: (context,index){
              var pObj = listArr[index] as Map? ?? {};

              //  return ProductCard(pObj: pObj, onPressed: (){}, onCart: (){},margin: 0,weight: double.maxFinite,);
             })      
         
      
   );
    
    
    
   
  }
}