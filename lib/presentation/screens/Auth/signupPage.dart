import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sellingportal/presentation/screens/Auth/loginPage.dart';
import 'package:sellingportal/presentation/screens/Auth/provider/signup_provider.dart';

import 'package:sellingportal/presentation/widget/MyElevatedButton.dart';

class signup extends StatelessWidget {
  static const String routeName = "signup";
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignupProvider>(context);
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: provider.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                margin: EdgeInsets.only(top: screenHeight * 0.1),
                child: Text(
                  'Sign up',
                  style: TextStyle(
                      fontSize: screenHeight * 0.03,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: screenHeight * 0.02),
                child: TextFormField(
                  controller: provider.nameController,
                  style: commonTextsStyle(),
                  decoration: commonInputDecoration(labelText: "Full Name"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: screenHeight * 0.02),
                child: TextFormField(
                  controller: provider.phoneNumberController,
                  style: commonTextsStyle(),
                  keyboardType: TextInputType.number,
                  decoration: commonInputDecoration(labelText: "Phone"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: screenHeight * 0.02),
                child: TextFormField(
                  style: commonTextsStyle(),
                  controller: provider.emailController,
                  decoration: commonInputDecoration(labelText: "Email"),
                  validator: (value) {
                    validateUsername(value);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: screenHeight * 0.02),
                child: TextFormField(
                    controller: passwordController,
                    style: commonTextsStyle(),
                    obscureText: true,
                    decoration: commonInputDecoration(labelText: "Password"),
                    validator: (value) {
                      validatePassword(value);
                    }),
              ),
              Container(
                margin: EdgeInsets.only(top: screenHeight * 0.02),
                width: double.infinity,
                child: MyElevatedButton(
                    child: Text('SIGN UP',
                        style: commonTextsStyle(color: Colors.white)),
                    onPressed: () {
                      print(usernameController.toString());
                      provider.signup();
                    }),
              ),
              Container(
                margin: EdgeInsets.only(top: screenHeight * 0.02),
                child: Column(
                  children: [
                    Text('Or'),
                    SizedBox(height: 8.0),
                    Container(
                      margin: EdgeInsets.only(top: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account",
                            style: commonTextsStyle(fontsize: 15.0),
                          ),
                          SizedBox(width: 8.0),
                          GestureDetector(
                              child: Text(
                                'Login',
                                style:
                                    commonTextsStyle(color: Color(0xFF2591EA)),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                );
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

bool? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return false;
  }

  return true;
}

bool? validateUsername(String? value) {
  if (value == null || value.isEmpty) {
    return false;
  }
  return true; // Return null if validation passes
}

void signupNow(String name, String username, String passwod, String phone) {}

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
      borderSide: BorderSide(
          color: focusedBorderColor,
          width: borderWidth), // Specify focused border color and width
    ),
  );
}

TextStyle commonTextsStyle(
    {Color color = Colors.black, double fontsize = 18.0}) {
  return TextStyle(
      fontSize: fontsize,
      color: color,
      fontWeight: FontWeight.normal,
      fontFamily: "Poppins");
}

ButtonStyle ButtonView() {
  return ElevatedButton.styleFrom(
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
  );
}
