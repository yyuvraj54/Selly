import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sellingportal/data/model/product_model.dart';
import 'package:sellingportal/logic/cubits/products/product_cubit.dart';
import 'package:sellingportal/logic/cubits/user/user_cubit.dart';
import 'package:sellingportal/logic/cubits/user/user_state.dart';
import 'package:sellingportal/presentation/screens/screen/sellFormScreens/CustomInput.dart';

import '../../../logic/cubits/user/userToke.dart';

class sellPage extends StatefulWidget {
  static const String routeName = 'sellPage';
   sellPage({super.key});

  @override
  State<sellPage> createState() => _sellPageState();
}

class _sellPageState extends State<sellPage> {
ProductModel productModel = ProductModel();

TextEditingController photoContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<UserCubit,UserState>(
          builder: (context,state) {
            if(state is UserLoadingState){
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if(state is UserErrorState){
              return Center(
                child: Text(state.message.toString()),
              );
            }
            if(state is UserLoggedInState){
              return ListView(
                children: [
                  Text(state.userModel.email.toString()),
                  CustomInput(
                    hint: 'title',
                    onChanged: (v){
                      productModel.title = v.toString();
                    },
                  ),
                  CustomInput(
                    hint: 'desc',
                    onChanged: (v){
                      productModel.description = v.toString();
                    },
                  ),CustomInput(
                    hint: 'category',
                    onChanged: (v){
                      productModel.category = v.toString();
                    },
                  ),CustomInput(
                    hint: 'price',
                    onChanged: (v){
                      productModel.price = int.tryParse(v);

                      print(productModel.price);
                    },
                  ),CustomInput(
                    hint: 'condition',
                    onChanged: (v){
                      productModel.condition = v.toString();
                    },
                  ),CustomInput(
                    hint: 'photo',
                    controller: photoContoller,

                  ),

                  ElevatedButton(onPressed: (){

                    // productModel.photos.add(photoContoller.text.toString());
                    // print(photoContoller.text.toString());

                    productModel.listedBy = state.userModel.sId;
                    // BlocProvider.of<ProductCubit>(context).addToProductListings(productModel,UserToken.token.toString());
                    setState(() {

                    });
                  }, child: Text('submit')),



                ],
              );
            }
return Center(child: Text('an error occured'),);
          }
        )) );}}