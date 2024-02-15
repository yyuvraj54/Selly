import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sellingportal/presentation/widget/MyElevatedButton.dart';


GlobalKey<FormState> _formKey = GlobalKey<FormState>();
bool _isSaveEnabled = false;

class registration extends StatelessWidget {
  const registration({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top:50),
                alignment: Alignment.center,
                child: CircleAvatar(radius: 60.0, backgroundImage: AssetImage('assets/images/profile.png'),
                ),
              ),

              Container(
                margin: EdgeInsets.only(top:30),
                child: Text(' Registration ',style: TextStyle(fontSize: screenHeight * 0.03, fontWeight: FontWeight.bold,fontFamily: "Poppins"),
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: screenHeight * 0.02),
                child: TextFormField(
                  // controller: ,
                  decoration: commonInputDecoration(labelText: "Admission number"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: screenHeight * 0.02),
                child: TextFormField(
                  // controller: ,
                  decoration: commonInputDecoration(labelText: "Address"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
              ),


              Container(
                margin: EdgeInsets.only(top: screenHeight * 0.02),
                child: DropdownButtonFormField<String>(
                  decoration: commonInputDecoration(labelText: "College Name"),
                  items: [DropdownMenuItem<String>(value: "option1", child: Text("JSS College"),),
                    DropdownMenuItem<String>(value: "option2", child: Text("JIIT Sector-62"),),],
                  validator: (value) {if (value == null || value.isEmpty) {return 'Please select an option';}return null;},
                  onChanged: (value) {},),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20,15.0,20,0),
                child: Container(
                  margin: EdgeInsets.only(top: screenHeight * 0.02),
                  width: double.infinity,
                  child: MyElevatedButton(child:Text('SAVE',style: commonTextsStyle(color: Colors.white)),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Form is validated, enable save functionality here
                        // For now, just print a message
                        print('Form is valid, enable save functionality here');
                      } else {
                        // Form is not valid, show an error message or handle accordingly
                        print('Form is invalid');
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


InputDecoration commonInputDecoration({
  required String labelText,
  Color borderColor = Colors.grey,
  double borderWidth = 2.0,
  Color focusedBorderColor = Colors.black,
}) {
  return InputDecoration(
    labelText: labelText,
    labelStyle: TextStyle(
      fontFamily: 'Poppins', // Apply Poppins font to labelText
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: borderColor, width: borderWidth),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: focusedBorderColor, width: borderWidth), // Specify focused border color and width
    ),
  );
}



TextStyle commonTextsStyle({Color color = Colors.black ,double fontsize =  18.0}) {
  return TextStyle( fontSize: fontsize,color: color, fontWeight: FontWeight.normal,fontFamily: "Poppins");
}


ButtonStyle ButtonView() {
  return ElevatedButton.styleFrom(
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
  );
}
