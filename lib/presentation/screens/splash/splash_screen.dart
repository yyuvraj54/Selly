import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sellingportal/presentation/screens/Auth/loginPage.dart';
import 'package:sellingportal/presentation/screens/screen/home/homescreen.dart';
import 'package:sellingportal/presentation/screens/screen/settingsScreen/registrationPage.dart';

import '../../../logic/cubits/user/user_cubit.dart';
import '../../../logic/cubits/user/user_state.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = 'SplashScreen' ;
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _goToNextScreen(){
    UserState userState = BlocProvider.of<UserCubit>(context).state;
    if(userState is UserLoggedInState){
      if(userState.userModel.telegram_username==""||userState.userModel.college==""||userState.userModel.address==""){
        Navigator.pushReplacementNamed(context,registration.routeName,arguments: userState.userModel);
      }
      else{
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushReplacementNamed(context, homeScreen.routeName);
      }

    }
    else if(userState is UserErrorState){
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
    }
    if(userState is UserLoggedOutState){
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(milliseconds: 100), () {
      _goToNextScreen();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit,UserState>(
      listener: (context,state){
        _goToNextScreen();
      },
      child: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
