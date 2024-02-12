import 'package:flutter/material.dart';
import 'package:marketmate/app/utils/color_extension.dart';
import 'package:marketmate/common_widgets/explore_card.dart';
import 'package:marketmate/explore/exploredetail_view.dart';
import 'package:marketmate/explore/search_view.dart';
import 'package:marketmate/features/home/views/Product_details_view.dart';


class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _HomeViewState();
}

class _HomeViewState extends State<ExploreView> {
  @override
   TextEditingController txtSearch =TextEditingController();
  
List findProductsArr =[
{
  "name":"Fresh Fruits & Vegetables",
  "icon":"assets/images/categories_images/fruit.png",
  "color":const Color(0xff53B175),

},
{
  "name":"Cooking oil & Ghee",
  "icon":"assets/images/categories_images/oil.png",
  "color":const Color(0xffF8A44C),
},

{
  "name":"Bakery & Snacks",
  "icon":"assets/images/categories_images/bakery.png",
  "color":const Color(0xffF7A593),
},

{
  "name":"Meat & Fish",
  "icon":"assets/images/categories_images/meat.png",
  "color":const Color(0xffD3B0E0),
},

{
  "name":"Dairy & Eggs",
  "icon":"assets/images/categories_images/dairy.png",
  "color":const Color(0xffFA8072),
},

{
  "name":"Beverages",
  "icon":"assets/images/categories_images/beverages.png",
  "color":const Color(0xffF6D365),
},
 


];




  @override
  Widget build(BuildContext context) {
    var media =MediaQuery.sizeOf(context);
    return  
           Scaffold(backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
            title: Text("Find Products",style: TextStyle(color: Tcolor.primaryText,fontSize: 20,fontWeight: FontWeight.w700),),
          ),
      
      
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ 

         
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                color: const Color(0xffF2F3F2),
                borderRadius: BorderRadius.circular(15)
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: txtSearch,
                onChanged: (value){
                  if (value == "egg"){
                    setState(() {
                      
                Navigator.push(context, MaterialPageRoute(builder:  (context) => const SearchView()));
                    });
                  }
                  setState(() {
                    
                  });
                },
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
          // Row(
          //   children: [
          //       Padding(padding: EdgeInsets.all(13),
          //       child:Icon(Icons.search,color: Tcolor.primary,size: 35,) ,),
          //        Text("Search Srore",style: TextStyle(color: Tcolor.secondaryText,fontSize: 14,fontWeight: FontWeight.w600),),


          //   ],
          // ),

          


          Expanded(
            child: GridView.builder(
              
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
              childAspectRatio: 0.95,crossAxisSpacing: 15,mainAxisSpacing: 15),
              itemCount: findProductsArr.length,
               itemBuilder: (context,index){
                var pObj =findProductsArr[index] as Map? ?? {};
                 return ExploreCard(pObj: pObj, onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  ExploreDetail(eObj: pObj)));
                 });
               }),
          )


            

          

          
          
          


            
            
           
            ],
          ) ,
      
   );
    
    
    
   
  }
}