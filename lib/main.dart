import 'dart:developer';


import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sellingportal/core/routes.dart';
import 'package:sellingportal/data/data_repository/category_repository.dart';
import 'package:sellingportal/data/data_repository/user_repository.dart';
import 'package:sellingportal/data/model/user_model.dart';
import 'package:sellingportal/logic/cubits/category/category_cubit.dart';
import 'package:sellingportal/logic/cubits/myItems/myItems_cubit.dart';
import 'package:sellingportal/logic/cubits/products/product_cubit.dart';
import 'package:sellingportal/logic/cubits/user/user_cubit.dart';
import 'package:sellingportal/logic/services/preferences.dart';
import 'package:sellingportal/presentation/screens/Auth/loginPage.dart';
import 'package:sellingportal/presentation/screens/Auth/signupPage.dart';
import 'package:sellingportal/presentation/screens/screen/profile/profile_screen.dart';
import 'package:sellingportal/presentation/screens/screen/settingsScreen/registrationPage.dart';
import 'package:sellingportal/presentation/screens/splash/splash_screen.dart';

import 'package:sellingportal/presentation/widget/cards.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 // Preferences.clear();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
       BlocProvider(create: (context)=>UserCubit()),
        BlocProvider(create: (context)=>CategoryCubit(userCubit: BlocProvider.of<UserCubit>(context))),
        BlocProvider(create: (context)=>ProductCubit(userCubit: BlocProvider.of<UserCubit>(context))),
        BlocProvider(create: (context)=>MyItemsCubit(userCubit: BlocProvider.of<UserCubit>(context))),
      ],
      child: MaterialApp(
        onGenerateRoute: Routes.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
        // home: registration(),
         
      ),
    );
  }
}
class MyBlocObserver extends BlocObserver{
  @override
  void onCreate(BlocBase bloc) {
    // TODO: implement onCreate
    log("Created: $bloc");
    super.onCreate(bloc);
  }
  @override
  void onChange(BlocBase bloc, Change change) {
    log("Change in: $bloc: $change");
    // TODO: implement onChange
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log("Change in: $bloc: $transition");
    // TODO: implement onTransition
    super.onTransition(bloc, transition);
  }
  @override
  void onClose(BlocBase bloc) {
    log("Closed: $bloc");
    // TODO: implement onClose
    super.onClose(bloc);
  }
}