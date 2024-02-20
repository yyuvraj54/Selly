import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sellingportal/data/model/product_model.dart';
import 'package:sellingportal/logic/cubits/my%20wish%20lis/myWishList_state.dart';
import 'package:sellingportal/logic/cubits/my%20wish%20lis/mywishlist_cubit.dart';
import 'package:sellingportal/logic/services/format.dart';
import 'package:sellingportal/res/colors/colors.dart';
import 'package:sellingportal/res/drawable/backgroundWave.dart';

class productScreen extends StatelessWidget {
  ProductModel productModel;

  productScreen({super.key, required this.productModel});

  Colours uiColor = Colours();
  @override
  static const String routeName = 'productScreen';

  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  BackgroundWave(
                      colors: Color.fromRGBO(23, 16, 193, 1),
                      height: height * .40),
                  BackgroundWave(
                      height: height * .32,
                      colors: Color.fromRGBO(
                        53,
                        45,
                        229,
                        1,
                      )),
                  BackgroundWave(
                      height: height * .24,
                      colors: Color.fromRGBO(
                        74,
                        67,
                        236,
                        1,
                      )),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: SafeArea(
                          child: IconButton(
                              color: Colors.black,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back)))),
                  Container(
                    width: double.infinity,
                    height: height * .40,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 70),
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: Container(

                            height: 250,
                            width: 200,
                          
                            child: CarouselSlider.builder(

                              itemCount: productModel.photos?.length ?? 0,
                              slideBuilder: (index) {
                                return Container(
                                  child: Image.network(
                                    productModel.photos![0],
                                    frameBuilder: (BuildContext context,
                                        Widget child,
                                        int? frame,
                                        bool wasSynchronouslyLoaded) {
                                      if (wasSynchronouslyLoaded) {
                                        return child;
                                      }
                                      return AnimatedOpacity(
                                        opacity: frame == null ? 0 : 1,
                                        duration: const Duration(seconds: 1),
                                        curve: Curves.easeOut,
                                        child: child,
                                      );
                                    },
                                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {

                                      return Center(child: const Text('😢'));
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              //Stack khatam

              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(productModel.title!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_pin,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('Jss Academy of Technical Education'),
                              ],
                            )
                          ],
                        ),
                        BlocBuilder<MyWishListCubit,MyWishListState>(
                          builder: (context,state) {
                            return IconButton(
                                onPressed: () {

                                  if( (BlocProvider.of<MyWishListCubit>(context).cartContains(productModel)))
                                  {
                                    BlocProvider.of<MyWishListCubit>(context)
                                        .removeFromCart(productModel);
                                  }
                                 else {
                                  BlocProvider.of<MyWishListCubit>(context)
                                      .addToCart(productModel);
                                }
                              },
                                icon: (BlocProvider.of<MyWishListCubit>(context).cartContains(productModel))?Icon(FontAwesomeIcons.solidBookmark):Icon(FontAwesomeIcons.bookmark));
                          }
                        ),

                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 10,
              ),
              Container(
                height: 1,
                color: Colors.grey,
              ), //line

              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      productModel.description!,
                      maxLines: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 1,
                color: Colors.grey,
              ), //line

              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Condition',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      productModel.condition!,
                      maxLines: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 1,
                color: Colors.grey,
              ), //line

              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Use Period',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      productModel.usePeriod!,
                      maxLines: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 1,
                color: Colors.grey,
              ), //line

              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Defects',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      'lorem ipsum',
                      maxLines: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Simillar items',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    shrinkWrap: false,
                    itemBuilder: (BuildContext context, int index) {
                      // return cardItem();
                      return Container();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomAppBar(
          color: Colors.white,
          surfaceTintColor: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Text('MRP'),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      Formatter.formatPrice(productModel.price!),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 0,
                    backgroundColor: Color.fromRGBO(86, 105, 255, 1)),
                onPressed: () => {},
                child: Text(
                  'Chat',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
