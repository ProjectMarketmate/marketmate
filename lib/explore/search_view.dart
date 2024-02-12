import 'package:flutter/material.dart';
import 'package:marketmate/app/utils/color_extension.dart';

import 'package:marketmate/features/home/widgets/product_card.dart';


class SearchView extends StatefulWidget {
  
  const SearchView({super.key, });

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
 TextEditingController txtSearch =TextEditingController();
 
  
List searchArr =[

{
  "name":"Egg Chicken Red",
  "icon":"assets/images/eggs/pngfuel 16.png",
  "qty":"4",
  "unit":"pcs, Price",
  "price":"Rs.50",
  
},


{
  "name":"Egg Chicken White",
  "icon":"assets/images/eggs/pngfuel 18.png",
  "qty":"2",
  "unit":"pcs, Price",
  "price":"Rs.40",
  
},

{
  "name":"Egg Pasta",
  "icon":"assets/images/eggs/Group 6848.png",
  "qty":"1",
  "unit":"Kg, Price",
  "price":"Rs.80",
  
},

{
  "name":"Egg Noodles",
  "icon":"assets/images/eggs/egg-noodle (1) 2.png",
  "qty":"1",
  "unit":"Kg, Price",
  "price":"Rs.45",
  
},
{
  "name":"Mayonnaise Eggless",
  "icon":"assets/images/eggs/American-Garden-Mayonnaise-Eggless-473ml 2.png",
  "qty":"325",
  "unit":"ml, Price",
  "price":"Rs.160",
  
},
{
  "name":"Egg Noodles",
  "icon":"assets/images/eggs/rp_24790392_0053554627_l 2.png",
  "qty":"2",
  "unit":"Kg, Price",
  "price":"Rs.80",
  
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
      actions: [ IconButton(onPressed: (){}, 
      icon:Image.asset("assets/images/filter.png",width: 20,height: 20,) ),],
            title:  Container(
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
                  suffixIcon: IconButton(onPressed: (){
                    txtSearch.text=="";
                    FocusScope.of(context).requestFocus(FocusNode());
                    setState(() {
                      
                    });
                  }, icon: Icon(Icons.close,color: Tcolor.primary,)),
              ),),
            ),
          ),
      
      
      body:
          


          GridView.builder(
            
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
            childAspectRatio: 0.75,crossAxisSpacing: 15,mainAxisSpacing: 15),
            itemCount: searchArr.length,
             itemBuilder: (context,index){
              var pObj = searchArr[index] as Map? ?? {};
              //  return ProductCard(pObj: pObj, onPressed: (){}, onCart: (){},margin: 0,weight: double.maxFinite,);
             })      
         
      
   );
    
    
    
   
  }
}