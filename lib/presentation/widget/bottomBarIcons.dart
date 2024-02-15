import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sellingportal/res/colors/colors.dart';

final Colours uiColor = Colours();

class BottomBarIcons {
  late int colorIndex;

  BottomBarIcons({required this.colorIndex});

  List<Icon> get bottomBarIconsList {
    return [
      Icon(
        FontAwesomeIcons.compass,
        color: uiColor.CategoryButtonState[colorIndex],
      ),
      Icon(
        FontAwesomeIcons.commentDots,
        color: uiColor.CategoryButtonState[colorIndex],
      ),
      Icon(
        FontAwesomeIcons.plus,
        color: uiColor.CategoryButtonState[colorIndex],
      ),
      Icon(
        Icons.person_2_outlined,
        color: uiColor.CategoryButtonState[colorIndex],
      )
    ];
  }
}
class categoryIcons{
  List<dynamic> get categoryIconsList {
    return [
      Icon(
        FontAwesomeIcons.calculator,
        size: 30,
        color:Colors.white,
      ),
      Icon(
        FontAwesomeIcons.book,
        color:Colors.white,
        size: 30,
      ),

      Icon(
        FontAwesomeIcons.bed,
        size: 30,
        color:Colors.white,
      ),
      Icon(
        Icons.microwave,
        size: 30,
        color:Colors.white,
      )
    ];
  }
}