import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sellingportal/logic/cubits/user/user_cubit.dart';
import 'package:sellingportal/logic/cubits/user/user_state.dart';
import 'package:sellingportal/presentation/screens/Auth/provider/login_provider.dart';
import 'package:sellingportal/presentation/screens/Auth/signupPage.dart';
import 'package:sellingportal/presentation/screens/splash/splash_screen.dart';

import '../../widget/MyElevatedButton.dart';



class LoginPage extends StatelessWidget {
  static const String routeName = 'LoginPage';
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);
    double screenHeight = MediaQuery.of(context).size.height;

    return BlocListener<UserCubit,UserState>(
      listener: (context,state){
        if(state is UserLoggedInState){
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacementNamed(context, SplashScreen.routeName);
          // log(state.userDetail.bearerToken.toString());
          log("in login page${state.userModel.sId.toString()}");

        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: provider.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: screenHeight * 0.1),
                  child: Text(' Login ',style: TextStyle(fontSize: screenHeight * 0.03, fontWeight: FontWeight.bold,fontFamily: "Poppins"),
                  ),
                ),
                (provider.error != "")
                    ? Text(
                  provider.error,
                  style: TextStyle(color: Colors.red),
                )
                    : SizedBox(),
                Container(
                  margin: EdgeInsets.only(top: screenHeight * 0.02),
                  child: TextFormField(
                    controller: provider.emailController,
                    decoration: commonInputDecoration(labelText: "Email"),
                    validator: (value) {
                      if(value==null|| value.trim() ==""){
                        return "Email address is required";
                      }
                      if(!EmailValidator.validate(value)){
                        return "Invalid email address";
                      }
                    },
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: screenHeight * 0.02),
                  child: TextFormField(
                    controller: provider.passwordController,
                    obscureText: true,
                    decoration: commonInputDecoration(labelText: "Password"),
                    validator: (value) {
                      if(value == null || value.trim()==''){
                        return "Password is required";
                      }

                    },
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: screenHeight * 0.02),
                  width: double.infinity,
                  child: MyElevatedButton(

                      child: Text('LOG IN',style: commonTextsStyle(color: Colors.white)),

                      onPressed: () {
                        provider.login();

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

                            Text("Don’t have an account? ", style: commonTextsStyle(fontsize: 15.0),),
                            GestureDetector(onTap: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => signup()),);},
                              child: Text('Sign up', style: commonTextsStyle(color: Color(0xFF2591EA)),),
                            ),
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
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Text('Welcome to the Home Screen!'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
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


