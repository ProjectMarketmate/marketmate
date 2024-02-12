import 'package:flutter/material.dart';
import 'package:marketmate/app/utils/color_extension.dart';
import 'package:marketmate/common_widgets/cart_item_row.dart';
import 'package:marketmate/features/cart/views/checkout_view.dart';



class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  List cartArr =[

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

{
  "name":"Ginger",
  "icon":"assets/images/grocery_images/ginger.png",
  "qty":"2",
  "unit":"pcs, Prices",
  "price":"RS 10",
},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0.5,
      title: Text("My Cart",style: TextStyle(color: Tcolor.primaryText,fontSize: 20,fontWeight: FontWeight.w700),),
    ),
    backgroundColor: Colors.white,
    body: Stack(
      alignment: Alignment.bottomCenter,
      children: [
          ListView.separated(
            padding: const EdgeInsets.all(20),
            separatorBuilder: (context,index)=>const Divider(color: Colors.black26,height: 1,),//divder at each list use in listview.seprated
            itemCount: cartArr.length,
            itemBuilder: (context,index){
              var pObj = cartArr[index] as Map? ?? {};
              return CartItemRow(pObj: pObj,);
            
          }),

// chechout button//////////////////////////////////////////
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MaterialButton(onPressed: (){

                //bottomsheet pop up function
                showcheckout();
              },
    height: 60,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(19),
    ),
    minWidth: double.maxFinite,
    elevation: 0.1,
    color: Tcolor.primary,
    
    
    child: 
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       

                        Text("Go to Checkout",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),
                        
                        ),
                        
                      ],
                    ),
                    Container(
                        
                
                
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(5),
                 
                ),
                padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 8),

                //inside round button price tag
                child:Text("Rs.350",style: const TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500),))
                  ],
                ),),
              
              //round Button end
             
            ],
          ),
        )
      ],
    ),
    
    );
  }

  //bottom sheet pop up
  void showcheckout(){
    
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isDismissible: false,
      context: context, builder: (context)=>const CheckoutView());
  }
}