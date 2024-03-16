import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketmate/app/utils/color_extension.dart';
import 'package:marketmate/app/common/widgets/explore_card.dart';
import 'package:marketmate/app/utils/context_extension.dart';
import 'package:marketmate/features/explore/cubit/explore_cubit.dart';
import 'package:marketmate/features/explore/exploredetail_view.dart';
import 'package:marketmate/features/explore/search_view.dart';
import 'package:marketmate/features/home/views/Product_details_view.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  @override
  TextEditingController txtSearch = TextEditingController();

  @override
  void initState() {
    context.read<ExploreCubit>().getAllCategories();
    super.initState();
  }

  final List<Color> colors=[
    Colors.green,
    Colors.teal,
    Colors.blue,
    Colors.purple,
    Colors.pink,
    Colors.amber,
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Find Products",
          style: TextStyle(
              color: Tcolor.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                  color: const Color(0xffF2F3F2),
                  borderRadius: BorderRadius.circular(15)),
              alignment: Alignment.center,
              child: TextField(
                controller: txtSearch,
                onChanged: (value) {
                  if (value == "egg") {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchView()));
                    });
                  }
                  setState(() {});
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Tcolor.primary,
                    size: 35,
                  ),
                  counterText: "",
                  border: InputBorder.none,
                  hintText: "Search Store",
                  helperStyle: TextStyle(
                      color: Tcolor.secondaryText,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          // Row(
          //   children: [
          //       Padding(padding: EdgeInsets.all(13),
          //       child:Icon(Icons.search,color: Tcolor.primary,size: 35,) ,),
          //        Text("Search Srore",style: TextStyle(color: Tcolor.secondaryText,fontSize: 14,fontWeight: FontWeight.w600),),

          //   ],
          // ),

          BlocConsumer<ExploreCubit, ExploreState>(
            listener: (context, state) {
             if(state is ExploreFailed){
                context.showErrorMessage(
                  state.error
                );
             }
            


            },
            builder: (context, state) {
              if (state is ExploreSuccess) {
                  return Expanded(
                child: GridView.builder(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.95,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15),
                    itemCount: state.categories.length,
                    itemBuilder: (context, index) {

                        final color  = colors[index%colors.length];
                      return ExploreCard(
                        color: color,
                            category: state.categories[index],
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ExploreDetail(category: state.categories[index],)));
                          });
                    }),
              );
              }
            
            return Center(
              child: CircularProgressIndicator(),
            );
            },
          )
        ],
      ),
    );
  }
}
