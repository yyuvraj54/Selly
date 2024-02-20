import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sellingportal/data/model/product_model.dart';
import 'package:sellingportal/presentation/screens/screen/profile/profile_screen.dart';

import '../../../logic/cubits/products/Product_state.dart';
import '../../../logic/cubits/products/product_cubit.dart';
import '../../../res/drawable/backgroundWave.dart';
import '../../widget/itemCard.dart';
import '../../widget/searchBar.dart';

class SearchScreen extends StatelessWidget {
  List<ProductModel> productList;
  static const String routeName = 'SearchScreen';
   SearchScreen({super.key,required this.productList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Search',style: GoogleFonts.poppins(color: Colors.white),),
          actions: [IconButton(onPressed: (){Navigator.pushNamed(context, ProfileScreen.routeName);}, icon: Icon(FontAwesomeIcons.user,color: Colors.white,)),],
          backgroundColor:Color.fromRGBO(74, 67, 236, 1) ,
        ),
        body: ListView(

          children: [
            //Background wave
            SizedBox(
              height: 210,
              child: Stack(
                children: [
                  BackgroundWave(
                    colors: Color.fromRGBO(74, 67, 236, 1),
                    height: 150,
                  ),
                  Positioned(
                    top: MediaQuery.of(context).padding.top-30,
                    child: SearchBarCustom(),
                    left: 16,
                    right: 16,
                  ),

                ],
              ),
            ),

            //new i

            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: (productList.isEmpty)?Container(child: Center(child: Text('Item not found'),),):GridView.builder(
                        padding: EdgeInsets.only(bottom: 110),
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: productList.length,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.8,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          final product = productList[index];
                          return cardItem(productModel: product,);
                        },
                      ),

            ),
          ],
        )
    );
  }
}
