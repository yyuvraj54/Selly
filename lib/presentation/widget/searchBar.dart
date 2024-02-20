import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sellingportal/data/data_repository/product_repository.dart';
import 'package:sellingportal/logic/cubits/products/product_cubit.dart';
import 'package:sellingportal/logic/cubits/user/userToke.dart';
import 'package:sellingportal/logic/cubits/user/user_cubit.dart';
import 'package:sellingportal/logic/cubits/user/user_state.dart';
import 'package:sellingportal/presentation/screens/screen/profile/profile_screen.dart';
import 'package:sellingportal/presentation/screens/screen/search_screen.dart';

class SearchBarCustom extends StatelessWidget {

  final blue = const Color.fromRGBO(74, 67, 236, 1);
  final grey = const Color(0xFFF2F2F7);

   SearchBarCustom({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    // UserCubit userCubit= BlocProvider.of<UserCubit>(context);
    //  UserLoggedInState ?userState;
    // if(userCubit.state is UserLoggedInState){
    //   userState = userCubit.state as UserLoggedInState;
    //
    // }
    return SizedBox(
      width: MediaQuery.of(context).size.width - 32,
      child: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //   Row(
          //     children: [
          //
          //       BlocBuilder<UserCubit,UserState>(
          //         builder: (context,state) {
          //           if(state is UserLoadingState){
          //             return CircularProgressIndicator();
          //           }
          //           if(state is UserLoggedInState){
          //             return Text("Hi, ${state.userModel.name} 👋", style: GoogleFonts.poppins(color: Colors.white,fontSize: 25),);
          //
          //           }
          //           else
          //             return Container();
          //         }
          //       ),
          //     ],
          //   ),
          //   IconButton(onPressed: (){Navigator.pushNamed(context, ProfileScreen.routeName);}, icon: Icon(FontAwesomeIcons.user,color: Colors.white,)),
          //
          // ],),
          // SizedBox(height: ,),
          TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              focusColor: blue,
              focusedBorder: _border(blue),
              border: _border(grey),
              enabledBorder: _border(grey),
              hintText: 'Search',
              contentPadding: const EdgeInsets.symmetric(vertical: 20),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
            onFieldSubmitted: (value) async{
           ProductRepository productRepo = ProductRepository();
           final productList = await productRepo.Search(value.trim().toString(), UserToken.token!);
            Navigator.pushNamed(context, SearchScreen.routeName,arguments: productList);


            },
          ),
        ],
      ),
    );
  }

  OutlineInputBorder _border(Color color) => OutlineInputBorder(
        borderSide: BorderSide(width: 0.5, color: color),
        borderRadius: BorderRadius.circular(12),
      );
}
