import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sellingportal/logic/cubits/user/user_cubit.dart';
import 'package:sellingportal/logic/cubits/user/user_state.dart';

class SearchBarCustom extends StatelessWidget {
  String? title;
  final blue = const Color.fromRGBO(74, 67, 236, 1);
  final grey = const Color(0xFFF2F2F7);

   SearchBarCustom({Key? key,required this.title}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 32,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Row(
              children: [

                Text("Hi, ${title!} 👋",style: TextStyle(fontSize: 20,color: Colors.white),),
              ],
            ),
            IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.user,color: Colors.white,)),

          ],),
          SizedBox(height: 30,),
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
            onFieldSubmitted: (value) {},
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
