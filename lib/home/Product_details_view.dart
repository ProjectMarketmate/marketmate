import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:marketmate/common/color_extension.dart';
import 'package:marketmate/common_widgets/line_textfield.dart';
import 'package:marketmate/common_widgets/roundbutton.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    var media =MediaQuery.sizeOf(context);
    return  
           Scaffold(backgroundColor: Colors.white,
            
      
      body:
         SingleChildScrollView(
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 

              Stack(alignment:Alignment.topCenter,
              children: [
                Container(width: double.maxFinite,
                height: media.width*0.8,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xffF2F3F2),
                  borderRadius: BorderRadius.circular(15)
                )
                ,
                child: Image.asset("assets/images/grocery_images/apple.png",width: media.width*0.8,),
                ),
                SafeArea(child: 
               AppBar(backgroundColor: Colors.transparent,
    elevation: 0,
      leading: IconButton(onPressed: (){Navigator.pop(context);}, 
      icon:Image.asset("assets/images/Frame.png",width: 20,height: 20,) ),
      actions:[ IconButton(onPressed: (){Navigator.pop(context);}, 
      icon:Image.asset("assets/images/share.png",width: 20,height: 20,) )
      ]),),
              ],),
              


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                          Expanded(
                            child: Text(" Red Apple",style: TextStyle(
                              color: Tcolor.primaryText,fontSize: 24,fontWeight: FontWeight.w700
                            ),),
                          ),

                        IconButton(onPressed: (){}, 
      icon:Icon(Icons.favorite_border_outlined,size: 25,) )
                        
                      ],
                    ),
                    Text(" 1kg,  price",style: TextStyle(
                              color: Tcolor.secondaryText,fontSize: 16,fontWeight: FontWeight.w600
                            ),),
                            const SizedBox(height: 15,),
                            Row(
                      children: [
                        InkWell(
                          
                          onTap: (){},
                          child: Icon(Icons.remove,size: 30,color: Tcolor.primaryText,),
                        ),

                        Container(width: 45,
                        
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xffF2F3F2),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Tcolor.placeholder.withOpacity(0.5),width: 1)
                )
                ,
                child:Text("1",style: TextStyle(
                            color: Tcolor.primaryText,fontSize: 18,fontWeight: FontWeight.w600
                          ),),
                ),
                 InkWell(
                          onTap: (){},
                          child: Icon(Icons.add,size: 30,color: Tcolor.primaryText,),
                        ),
                        Spacer(),
                          Text("Rs.80",style: TextStyle(
                            color: Tcolor.primaryText,fontSize: 24,fontWeight: FontWeight.w700
                          ),),

                       
                        
                      ],
                    ),
                    const SizedBox(height: 15,),
                    const Divider(color: Colors.black26,height: 1,),
                    

                    const SizedBox(height: 15,),
                    Row(
                      children: [
                          Expanded(
                            child: Text("Product deatils",style: TextStyle(
                              color: Tcolor.primaryText,fontSize: 16,fontWeight: FontWeight.w500
                            ),),
                          ),

                        IconButton(onPressed: (){}, 
      icon:Icon(Icons.arrow_drop_down,size: 30,) )
                        
                      ],
                    ),
                    Text("Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.",style: TextStyle(
                            color: Tcolor.secondaryText,fontSize: 13,fontWeight: FontWeight.w500
                          ),),

                    const SizedBox(height: 15,),
                     
                    const Divider(color: Colors.black26,height: 1,),
                    

                    const SizedBox(height: 15,),
                    Row(
                      children: [
                          Expanded(
                            child: Text("Nutritions",style: TextStyle(
                              color: Tcolor.primaryText,fontSize: 16,fontWeight: FontWeight.w500
                            ),),
                          ),
                           Container(
                       padding: const EdgeInsets.symmetric(vertical: 4,horizontal:8 ), 
                height: 25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Tcolor.placeholder.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Tcolor.placeholder.withOpacity(0.5),width: 1)
                )
                ,
                child:Text("100g",style: TextStyle(
                            color: Tcolor.primaryText,fontSize: 9,fontWeight: FontWeight.w600
                          ),),
                ),

                        IconButton(onPressed: (){}, 
      icon:Icon(Icons.arrow_forward_ios,size: 20,) )
                        
                      ],
                    ),
                    const SizedBox(height: 15,),
                     
                    const Divider(color: Colors.black26,height: 1,),
                    

                    const SizedBox(height: 15,),
                    Row(
                      children: [
                          Expanded(
                            child: Text("Review",style: TextStyle(
                              color: Tcolor.primaryText,fontSize: 16,fontWeight: FontWeight.w500
                            ),),
                          ),RatingBar.builder(
                           initialRating: 5,
                           minRating: 1,
                           direction: Axis.horizontal,
                           allowHalfRating: true,
                           itemCount: 5,
                           itemSize: 18,
                           itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                           itemBuilder: (context, _) => const Icon(
                             Icons.star,
                             color: Colors.amber,
                           ),
                           onRatingUpdate: (rating) {
                             print(rating);
                           },
                          ),
                          

                        IconButton(onPressed: (){}, 
      icon:Icon(Icons.arrow_forward_ios,size: 20,) )
                        
                      ],
                    ),
                    const SizedBox(height: 8,),

                       RoundButton(title:"Add To Basket", onPressed: (){}),
                  ],
                ),
              )
              
              // Text("Loging",style: 
              //   TextStyle(fontSize: 26,fontWeight: FontWeight.w600,
              //   color: Tcolor.primaryText)),
              //    SizedBox(height: media.width*0.03,),

              //   Text("Enter your email and password to login",
              //   textAlign: TextAlign.center,
              //   style: 
              //   TextStyle(fontSize: 16,fontWeight: FontWeight.w600,
              //   color: Tcolor.secondaryText)),

              // SizedBox(height: media.width*0.1,),
              //  LineTextField(controller: txtEmail, placeholder: "Enter your email address", title: "Email",keyboardType: TextInputType.emailAddress,),
               
               

              //    SizedBox(height: media.width*0.07,),
              //    LineTextField(controller: txtPassword
              //    , placeholder: "Enter your password", title: "Password",obscureText: isShow,right: IconButton(onPressed:(){
              //     setState(() {
              //       isShow=!isShow;
              //     });
              //    } , icon:Icon(
              //     !isShow? Icons.visibility_off:Icons.visibility,color: Tcolor.textTittle,)),),
                 
              //    Row(mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       TextButton(onPressed: (){}, child: Text("Forgot Password?",
              //       style: TextStyle(color: Tcolor.primaryText,fontSize: 14,fontWeight: FontWeight.w600),)),
              //     ],
              //    ),


                 
              //   SizedBox(height: media.width*0.1,),
               

                 


              
              
              


                
                
               
                ],
              ),
        ),
      
      
    
    );
}
}