import 'package:flutter/material.dart';
import 'package:marketmate/app/utils/color_extension.dart';

class FavoriteItemRow extends StatelessWidget {
  final Map pObj;
  
  
  
  const FavoriteItemRow({super.key, required this.pObj, });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      
      child: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(vertical: 10),
        
       color: Colors.white,
        
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(pObj['icon'],width: 80,height: 65,fit: BoxFit.contain,),
              const SizedBox(width: 15,),
        
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                        Row(
                          children: [
                             Expanded(child: Text(pObj['name'],style: 
                             TextStyle(color: Tcolor.primaryText,fontSize: 16,fontWeight: FontWeight.w700),
                             ),


                             
                             ),
                             Text(pObj['price'],
                                         style: TextStyle(color: Tcolor.primaryText,
                                         fontSize: 18,
                                         fontWeight: FontWeight.w600),),
              const SizedBox(width: 5,),
              InkWell(
                                onTap: () {
                                  
                                },
                                child: Icon(Icons.arrow_forward_ios,color: Tcolor.primaryText,size: 15,))
                              
                          ],
                        ),
                      const SizedBox(height: 2,),
                      Text("${pObj['unit']}",style: TextStyle(color: Tcolor.secondaryText,fontSize: 14,fontWeight: FontWeight.w500),),

                      const SizedBox(height: 10,),
                     
                    
                ],
              ),
            ),
           
        
        
        
            ],
          ),
        
        
        
           
        
          
        
        
          
          
        ],),
    ));
  }
}