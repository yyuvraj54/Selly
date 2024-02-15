import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sellingportal/logic/cubits/category/category_cubit.dart';
import 'package:sellingportal/logic/cubits/category/category_state.dart';
import 'package:sellingportal/logic/cubits/products/Product_state.dart';
import 'package:sellingportal/logic/cubits/products/product_cubit.dart';
import 'package:sellingportal/presentation/widget/cards.dart';
import 'package:sellingportal/presentation/widget/itemCard.dart';
import 'package:sellingportal/presentation/widget/searchBar.dart';
import 'package:sellingportal/presentation/widget/sliverSearchBar.dart';

import '../../../../res/drawable/backgroundWave.dart';



class explorePage extends StatelessWidget {
  const explorePage({super.key});
static const String routeName = 'explorePage';
  @override
  Widget build(BuildContext context) {
    List<String> categName = [
      'Books',
      'Gadgets',
      'Room Essentials',
      'Kitchen Appliances'
    ];

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 320,
                  child: Stack(
                    children: [
                      BackgroundWave(
                        colors: Color.fromRGBO(23, 16, 193, 1),
                        height: 280,
                      ),
                      Positioned(
                        top: MediaQuery.of(context).padding.top + 20,
                        child: const SearchBarCustom(),
                        left: 16,
                        right: 16,
                      ),
                      Positioned(
                        // top: MediaQuery.of(context).padding.top + 100,
                        top: 220,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 85,
                            child: BlocBuilder<CategoryCubit,CategoryState>(
                              builder: (context,state) {
                                if (state is CategoryLoadingState && state.categories.isEmpty) {
                                  return CircularProgressIndicator();
                                }
                                if (state is CategoryErrorState && state.categories.isEmpty) {
                                  return Center(
                                    child: Text(state.message.toString()),
                                  );
                                }
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 4,
                                  shrinkWrap: false,
                                  itemBuilder: (BuildContext context, int index) {
                                    return CardsCategory(
                                      index: index,
                                      categName: state.categories[index].title!,
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Text(
                    'New Items',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    child: BlocBuilder<ProductCubit,ProductState>(
                      builder: (context,state) {
                        if (state is ProductLoadingState && state.products.isEmpty) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (state is ProductErrorState && state.products.isEmpty) {
                          return Center(
                            child: Text(state.message.toString(),),
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
                            return cardItem(productModel: product,);
                          },
                        );
                      }
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
