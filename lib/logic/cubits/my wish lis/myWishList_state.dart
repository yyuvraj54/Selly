import 'package:sellingportal/data/model/my_wishlist_model.dart';

abstract class MyWishListState {
  List<MyWishListModel> mywshListItem;

  MyWishListState(this.mywshListItem);
}

class MyWishListInitialState extends MyWishListState {
  MyWishListInitialState() : super([]);
}

class MyWishListLoadingState extends MyWishListState {
  MyWishListLoadingState(super.mywshListItem);
}

class MyWishListLoadedState extends MyWishListState {
  MyWishListLoadedState(super.mywshListItem);
}

class MyWIshListErrorState extends MyWishListState {
  String? message;

  MyWIshListErrorState(super.mywshListItem, this.message);
}
