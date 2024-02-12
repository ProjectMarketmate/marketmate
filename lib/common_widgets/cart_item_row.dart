import 'package:flutter/material.dart';
import 'package:marketmate/app/utils/color_extension.dart';
import 'package:marketmate/features/home/widgets/itemcounterwidget.dart';

class CartItemRow extends StatelessWidget {
  final Map pObj;
  
  
  
  const CartItemRow({super.key, required this.pObj, });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      
      child: Container(
        height: 125,
        padding: const EdgeInsets.symmetric(vertical: 10),
        
       color: Colors.white,
        
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              //product image
              Image.asset(pObj['icon'],width: 80,height: 65,fit: BoxFit.contain,),
              SizedBox(width: 15,),
        
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                        Row(
                          children: [
                            //product name
                             Expanded(child: Text(pObj['name'],style: TextStyle(color: Tcolor.primaryText,fontSize: 16,fontWeight: FontWeight.w700),
                             )
                             ),
                              InkWell(
                                onTap: () {
                                  
                                },
                                child: Icon(Icons.close,color: Tcolor.secondaryText,size: 30,))
                          ],
                        ),
                      const SizedBox(height: 2,),
                      Text("${pObj['unit']}",style: TextStyle(color: Tcolor.secondaryText,fontSize: 14,fontWeight: FontWeight.w500),),

                      const SizedBox(height: 10,),
                      Row(
           
            children: [
              //counter buttons start
                ItemCounterWidget(),

                        //counter button ends

             
              
              
              
              
              const Spacer(),
              Text(pObj['price'],
              style: TextStyle(color: Tcolor.primaryText,
              fontSize: 18,
              fontWeight: FontWeight.w600),),
            
            
            
            ],
          )
                    
                ],
              ),
            ),
           
        
        
        
            ],
          ),
        
        
        
           
        
          
        
        
          
          
        ],),
    ));
  }
}