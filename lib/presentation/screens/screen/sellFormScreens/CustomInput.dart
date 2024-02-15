import 'package:flutter/material.dart';

import '../../../../res/colors/colors.dart';



class CustomInput extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final String? hint;
  final InputBorder? inputBorder;
  final TextInputType? inputType;

  final  TextEditingController? controller;// New parameter for input type
  const CustomInput({Key? key, this.onChanged, this.hint, this.inputBorder, this.inputType,this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextField(

        controller: controller,
        onChanged: (v) => onChanged!(v),
        decoration: commonInputDecoration(labelText : hint!, borderWidth: 1 ,themeColors: myColors,),
        keyboardType: inputType, // Setting the input type
      ),
    );
  }
}

Colours myColors = Colours();

InputDecoration commonInputDecoration({
  required String labelText,
  required Colours themeColors,
  Color borderColor = Colors.grey,
  double borderWidth = 2.0,
}) {
  return InputDecoration(
    labelText: labelText,
    labelStyle: TextStyle(fontFamily: 'Poppins', color: themeColors.subtitle),
    focusColor: themeColors.theme,
    // Add other decoration properties as needed
  );
}
