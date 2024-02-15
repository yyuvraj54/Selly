import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchBarCustom extends StatelessWidget {
  final blue = const Color.fromRGBO(74, 67, 236, 1);
  final grey = const Color(0xFFF2F2F7);

  const SearchBarCustom({Key? key}) : super(key: key);

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

                IconButton(onPressed: (){}, icon: Icon(Icons.menu,color: Colors.white,)),
                Text('Hi,Xyz',style: TextStyle(fontSize: 20,color: Colors.white),),
              ],
            ),
            IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.solidBell,color: Colors.white,)),

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
