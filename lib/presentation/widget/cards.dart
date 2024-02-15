import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sellingportal/presentation/widget/bottomBarIcons.dart';

class CardsCategory extends StatelessWidget {
  int index;
  String categName;

  CardsCategory({super.key, required this.index, required this.categName});
  List<Color> cardColor = [Color.fromRGBO(240, 99, 90, 1),Color.fromRGBO(245, 151, 98, 1),Color.fromRGBO(41, 214, 151, 1),Colors.purpleAccent];
  @override
  Widget build(BuildContext context) {
    categoryIcons categIcon = categoryIcons();

    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      onTap: () => {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          height: 50,
          width: 170,
          child: Card(
            surfaceTintColor: cardColor[index],
            color: cardColor[index],
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20,
                ),

                  categIcon.categoryIconsList[index],

                SizedBox(
                  width: 13,
                ),
                Expanded(
                  child: Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    categName,
                    style: TextStyle(fontSize: 19, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
