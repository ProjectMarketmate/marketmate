import 'package:flutter/material.dart';
import 'package:marketmate/common/color_extension.dart';
import 'package:marketmate/common_widgets/filter_row.dart';
import 'package:marketmate/common_widgets/roundbutton.dart';

class FilterView extends StatefulWidget {
  const FilterView({super.key});

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {

  List selectArr =[];

  List filterCatArr = [
    {
      "id":"1",
      "name":"Eggs",
     
      
    },
    {
      "id":"2",
      "name":"Noodle & Pasta",
     
      
    },
    {
      "id":"3",
      "name":"Chips & Crisps",
     
      
    },
     {
      "id":"4",
      "name":"Fast Food",
     
      
    },

  ];

  List filterbrandArr = [
    {
      "id":"1",
      "name":"Individual Collection",
     
      
    },
    {
      "id":"2",
      "name":"Cocola",
     
      
    },
    {
      "id":"3",
      "name":"Ifad",
     
      
    },
     {
      "id":"4",
      "name":"Kazi farmas",
     
      
    },

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
            leading:  IconButton(onPressed: (){Navigator.pop(context);}, 
      icon:Icon(Icons.close,size: 20,color: Tcolor.darkGrey,) ),
      
            title: Text("Filters",style: TextStyle(color: Tcolor.primaryText,fontSize: 20,fontWeight: FontWeight.w700),),
          ),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Color(0xffF2F3F2),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
        ),
        child: Column(
          
        children: [
         Expanded(child: SingleChildScrollView
         (child: 
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 8),
               child: Text("Categories",
               style: TextStyle(color: Tcolor.primaryText,
               fontSize: 20,fontWeight: FontWeight.w700),),
             ),

             Column(
              children: 
                filterCatArr.map((fObj) {
                  return FilterRow(fObj: fObj, isSelect: selectArr.contains(fObj), onPressed: (){

                    setState(() {
                      if(selectArr.contains(fObj)){
                        selectArr.remove(fObj);
                        
                      }else{
                        selectArr.add(fObj);
                      }
                    });
                  });
                }).toList()
              
             ),
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 8),
               child: Text("Brand",
               style: TextStyle(color: Tcolor.primaryText,
               fontSize: 20,fontWeight: FontWeight.w700),),
             ),

             const SizedBox(height: 10,),

             Column(
              children: 
                filterbrandArr.map((fObj) {
                  return FilterRow(fObj: fObj, isSelect: selectArr.contains(fObj), onPressed: (){

                    setState(() {
                      if(selectArr.contains(fObj)){
                        selectArr.remove(fObj);
                        
                      }else{
                        selectArr.add(fObj);
                      }
                    });
                  });
                }).toList()
              
             )
           ],
         )
         )
         ),
         RoundButton(title: "Apply Filter", onPressed: (){},),

        ],
      ),
      
      ),
      
      );
  }
}