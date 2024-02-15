import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sellingportal/logic/cubits/user/user_cubit.dart';
import 'package:sellingportal/logic/cubits/user/user_state.dart';

import '../../../data/data_repository/category_repository.dart';
import '../../../data/model/category_model.dart';
import '../user/userToke.dart';
import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  UserCubit userCubit;
  StreamSubscription? _userSubscription;

  CategoryCubit({required this.userCubit}) : super(CategoryInitialState()) {
    _handUserState(userCubit.state);

    _userSubscription =  userCubit.stream.listen(_handUserState);
  }
  void _handUserState(UserState userState){
    if(userState is UserLoggedInState){
      _initialize(UserToken.token.toString());
    }
    else if (userState is UserLoggedOutState){
      emit(CategoryInitialState());
    }
  }
  final CategoryRepository _categoryRepository = CategoryRepository();

  void _initialize(String BEARER_TOKN) async {
    emit(CategoryLoadingState(state.categories));
    try {
      List<CategoryModel> categories =
          await _categoryRepository.FetchAllCategory(BEARER_TOKN);
      emit(CategoryLoadedState(categories));
    } catch (error) {
      emit(CategoryErrorState(state.categories, error.toString()));
    }
  }
}
