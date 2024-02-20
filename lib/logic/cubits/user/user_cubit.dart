//presentation layer aur data layer kko connect karta h ek logic component
//global state management ke liye hm cubit/bloc use karenge
// and page specific satte management ke liye provider ka use karemnge

//cubit/provider/bloc ye link hota h between DATA and PRESENTATION
//so data[repository] ke sare functions available karan padenge.. CUBIT me
//ki presentation bhi use kar sake

import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sellingportal/logic/cubits/user/userToke.dart';
import 'package:sellingportal/logic/cubits/user/user_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/data_repository/user_repository.dart';
import '../../../data/model/user_model.dart';
import '../../services/preferences.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitialState()){
    _initialize();
  }

  //toh data layer ke sigina nd create account functions ko yaha pe available karana hoga
  final UserRepository _userRepository = UserRepository();
  void _initialize() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    UserToken.token = await sharedPreferences.getString('token');
    UserToken.name = await sharedPreferences.getString('name');



    final userDetail = await Preferences.getUserDetail();
    String? email = userDetail['email'];
    String? password = userDetail['password'];
    if(email==null||password==null){
      emit(UserLoggedOutState());
    }
    else{
      Login(email: email, password: password);
    }
  }
  void _emitLoggedInState({required String email, required String password, required UserModel userModel}) async {

    await Preferences.saveUserDetail(email, password);
    emit(UserLoggedInState(userModel));

  }

  void Login({required email, required password}) async {
    try {
      UserModel userModel =
      await _userRepository.login(email: email, password: password);
      _emitLoggedInState(
          email: email, password: password, userModel: userModel);
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString('name', userModel.name!);
      UserToken.id = userModel.sId;
    } catch (error) {
      emit(UserErrorState(error.toString()));
    }
  }

  void createAccount({required email, required password, required name, required phoneNumber,}) async {
    try {
      UserModel userModel =
      await _userRepository.createAccount(email: email, password: password, name: name, phoneNumber: phoneNumber);
      _emitLoggedInState(
          email: email, password: password, userModel: userModel);
    } catch (error) {
      log(error.toString());
      emit(UserErrorState(error.toString()));
    }
  }

  Future<bool> updateUser(UserModel userModel) async {
    emit( UserLoadingState() );
    try {
      UserModel updatedUser = await _userRepository.updateUser(userModel);
      emit( UserLoggedInState(updatedUser) );
      return true;
    }
    catch(ex) {
      emit( UserErrorState(ex.toString()) );
      return false;
    }
  }
  void signOut() async{
    Preferences.clear();
    emit(UserLoggedOutState());
  }
}
//abb iss user cubit ko globally available karana hoga ki pure app ke screen ko pata ho ki user ka login status kya h
