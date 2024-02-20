import 'dart:async';



import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer';
import 'package:provider/provider.dart';
import 'package:sellingportal/data/data_repository/mywishlist_repository.dart';
import 'package:sellingportal/data/model/my_wishlist_model.dart';
import 'package:sellingportal/logic/cubits/my%20wish%20lis/myWishList_state.dart';

import '../../../data/model/product_model.dart';
import '../user/user_cubit.dart';
import '../user/user_state.dart';

class MyWishListCubit extends Cubit<MyWishListState>{
  //connect usercubit to cartcubit by passing the current instance of usercobit.. in the main.dart
  final UserCubit _userCubit;
  StreamSubscription? _userSubscription;
  MyWishListCubit(this._userCubit ):super(MyWishListInitialState()){
    //initial value--> matlab already logged in ya logged hoga wo state
    _handUserState(_userCubit.state);
    //abb in the middle of the running app jo bhi hoga state user uske basis pe cart ka state handle hoga
    _userSubscription =  _userCubit.stream.listen(_handUserState);

  }
  void _handUserState(UserState userState){
    if(userState is UserLoggedInState){
      initialize(userState.userModel.sId!);
    }
    else if (userState is UserLoggedOutState){
      emit(MyWishListInitialState());
    }
  }
  final _myWishListRepository = MyWishListRepository();

  void sortAndLoad(List<MyWishListModel> myWIshListItem){
    //ek cart me problem aari thi ki items ke quantity change karne p items upar niche hone lagre the so usko sai karne ke liye
    //hm ek proprty like title ke basis pe sort krlenege har ek item ko and then emit karenge loaded state ko
    myWIshListItem.sort((a , b)=> b.product!.title!.compareTo(a.product!.title!));
    emit(MyWishListLoadedState(myWIshListItem));
  }
  void initialize(String userId) async{

    emit(MyWishListLoadedState(state.mywshListItem));
    try{
      final item = await _myWishListRepository.FetchWishList();
      sortAndLoad(item);

    }catch(error){
      emit(MyWIshListErrorState(state.mywshListItem, error.toString()));
    }
  }


  void addToCart(ProductModel product ) async{
    emit(MyWishListLoadedState(state.mywshListItem));
    try{
      if(_userCubit.state is UserLoggedInState){

        UserLoggedInState userState = _userCubit.state as UserLoggedInState;

        MyWishListModel newItem =  MyWishListModel(
            product: product
        );
        print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
        final List<MyWishListModel>updatedItem = await _myWishListRepository.addToCart(newItem);
        print("................................");
        print(updatedItem);
        sortAndLoad(updatedItem);
      }
      else{
        throw Exception;
      }
    }catch(error){
      log(error.toString());
      emit(MyWIshListErrorState(state.mywshListItem, error.toString()));

    }
  }
  bool cartContains(ProductModel product){
    if(state.mywshListItem.isNotEmpty){
      final foundItem = state.mywshListItem.where((item) => item.product!.sId == product.sId).toList();
      if(foundItem.isNotEmpty){
        return true;
      }
      else{
        return false;
      }
    }
    return false;
  }

  @override
  Future<void> close() {
    // TODO: implement close
    _userSubscription?.cancel();
    return super.close();
  }

  void removeFromCart(ProductModel product) async{

    emit(MyWishListLoadingState(state.mywshListItem));
    try{
      if(_userCubit.state is UserLoggedInState){
        UserLoggedInState userState = _userCubit.state as UserLoggedInState;

        final updatedCart =  await _myWishListRepository.removeFromCart(product.sId!);
        sortAndLoad(updatedCart);
      }
    }catch(error){
      emit(MyWIshListErrorState(state.mywshListItem, error.toString()));
    }
  }
}