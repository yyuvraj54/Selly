import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:sellingportal/data/data_repository/product_repository.dart';
import 'package:sellingportal/logic/cubits/myItems/myitems_state.dart';
import 'package:sellingportal/logic/cubits/user/userToke.dart';
import 'package:sellingportal/logic/cubits/user/user_cubit.dart';

import '../user/user_state.dart';

class MyItemsCubit extends Cubit<MyItemsState>{
  final UserCubit? userCubit;
  StreamSubscription? _userSubscription;

  MyItemsCubit({ this.userCubit}):super(MyItemsInitialState()){
    // _handUserState(userCubit!.state);
    //
    // _userSubscription = userCubit!.stream.listen(_handUserState);
    LoadMyItems();
  }
  // void _handUserState(UserState userState) {
  //   if (userState is UserLoggedInState) {
  //     LoadMyItems(UserToken.token.toString());
  //   } else if (userState is UserLoggedOutState) {
  //     emit(MyItemsInitialState());
  //   }
  // }
  void LoadMyItems() async{
    emit(MyItemsLoadingState(state.products));
    try{
      final MyListItems = await productRepository.FetchMyItems(UserToken.id!, UserToken.token!);
      MyListItems.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
      emit(MyItemsLoadedState(MyListItems));
    }
    catch(error){
      emit(MyItemsErrorState(state.products,error.toString()));
    }

  }
  }

  ProductRepository productRepository= ProductRepository();



