import 'package:flutter/material.dart';
import 'package:marketmate/common/color_extension.dart';

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
                 InkWell(
                          
                          onTap: (){},
                          child: Container(width: 40,
                        
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xffF2F3F2),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Tcolor.placeholder.withOpacity(0.5),width: 1)
                )
                ,
                child:Icon(Icons.remove,size: 25,color: Tcolor.primaryText,),)
                        ),
                        const SizedBox(width: 15,),
                        Text(pObj['qty'].toString(),
              style: TextStyle(color: Tcolor.primaryText,
              fontSize: 16,
              fontWeight: FontWeight.w600),),
              const SizedBox(width: 15,),

                //         Text("1",style: TextStyle(
                //             color: Tcolor.primaryText,fontSize: 18,fontWeight: FontWeight.w600
                //           ),),
                // ),
                InkWell(
                          
                          onTap: (){},
                          child: Container(width: 40,
                        
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xffF2F3F2),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Tcolor.placeholder.withOpacity(0.5),width: 1)
                )
                ,
                child:Icon(Icons.add,size: 25,color: Tcolor.primary,),)
                        ),

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