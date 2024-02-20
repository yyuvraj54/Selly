import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sellingportal/logic/cubits/myItems/myItems_cubit.dart';
import 'package:sellingportal/logic/cubits/myItems/myitems_state.dart';
import 'package:sellingportal/presentation/screens/Auth/loginPage.dart';

import '../../../res/drawable/backgroundWave.dart';
import '../../widget/itemCard.dart';

class Items extends StatelessWidget {
  static const String routeName = 'Items';

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Column(
            children: [
              SizedBox(
                height: height*.20,
                child: Stack(children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: height * 0.20,
                      child: BackgroundWave(
                        height: height * 20,
                        colors: Color.fromRGBO(74, 67, 236, 1),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: AppBar(
                      title: Text('My Items',style: GoogleFonts.poppins(color: Colors.white),),
                      backgroundColor: Color.fromRGBO(74, 67, 236, 1),
                    ),
                  ),
                ]),
              ),
              //items
              Flexible(
                child: RefreshIndicator(
                  onRefresh: () async{
                    BlocProvider.of<MyItemsCubit>(context).LoadMyItems();
                  },
                  child: ListView(
                    children: [Container(
                      child: BlocBuilder<MyItemsCubit, MyItemsState>(
                        builder: (context, state) {
                          if (state is MyItemsLoadingState && state.products.isEmpty) {
                            return Center(child: CircularProgressIndicator());
                          }
                          if (state is MyItemsErrorState && state.products.isEmpty) {
                            return Center(
                              child: Text(
                                state.message.toString(),
                              ),
                            );
                          }
                          if (state is MyItemsLoadedState && state.products.isEmpty) {
                            return Center(
                              child: Text("No product listed 😢"),
                            );
                          }
                          return GridView.builder(
                            padding: EdgeInsets.only(bottom: 110),
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: state.products.length,
                            shrinkWrap: true,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.8,
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              final product = state.products[index];
                              return cardItem(
                                productModel: product,
                              );
                            },
                          );
                        },
                      ),
                    ),]
                  ),
                ),
              ),
            ],
          ),

      // body: Column(
      //   children: [
      //     Stack(
      //       children: [
      //         Positioned(
      //           top: 0,
      //           left: 0,
      //           right: 0,
      //           child: Container(
      //             height: height * 0.20,
      //             child: BackgroundWave(
      //               height: height * 20,
      //               colors: Color.fromRGBO(74, 67, 236, 1),
      //             ),
      //           ),
      //         ),
      //         Positioned(
      //           top: 0,
      //           left: 0,
      //           right: 0,
      //           child: AppBar(
      //             backgroundColor: Color.fromRGBO(74, 67, 236, 1),
      //             title: Text(
      //               'My Items',
      //               style: commonTextsStyle(
      //                 fontsize: 20,
      //                 color: Colors.white,
      //               ), // You can use your commonTextsStyle here),
      //             ),
      //             // Add more app bar properties if needed
      //           ),
      //         ),
      //
      //       ],
      //     ),
      //
      //
      //
      //     Flexible(
      //       child: Container(
      //         child: BlocBuilder<MyItemsCubit,MyItemsState>(
      //           builder: (context,state){
      //             if (state is MyItemsLoadingState && state.products.isEmpty) {
      //               return Center(child: CircularProgressIndicator());
      //             }
      //             if (state is MyItemsErrorState && state.products.isEmpty) {
      //               return Center(
      //                 child: Text(state.message.toString(),),
      //               );
      //             }
      //             if (state is MyItemsLoadedState && state.products.isEmpty) {
      //               return Center(
      //                 child: Text("No product listed 😢"),
      //               );
      //             }
      //             return GridView.builder(
      //               padding: EdgeInsets.only(bottom: 110),
      //               // physics: NeverScrollableScrollPhysics(),
      //               itemCount: state.products.length,
      //               shrinkWrap: true,
      //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //                 childAspectRatio: 0.8,
      //                 crossAxisCount: 2,
      //               ),
      //               itemBuilder: (BuildContext context, int index) {
      //                 final product = state.products[index];
      //                 return cardItem(productModel: product,);
      //               },
      //             );
      //           },
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      // Add the rest of your Scaffold properties here
    );
  }
}
