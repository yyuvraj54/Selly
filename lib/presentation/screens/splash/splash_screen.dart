import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sellingportal/presentation/screens/Auth/loginPage.dart';
import 'package:sellingportal/presentation/screens/screen/home/homescreen.dart';

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
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacementNamed(context, homeScreen.routeName);
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
