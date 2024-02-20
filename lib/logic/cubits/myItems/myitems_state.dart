import '../../../data/model/product_model.dart';

abstract class MyItemsState {
  List<ProductModel> products;

  MyItemsState(this.products);
}
class MyItemsInitialState extends MyItemsState{
  MyItemsInitialState():super([]);
}
class MyItemsLoadingState extends MyItemsState{
  MyItemsLoadingState(super.products);
}
class MyItemsLoadedState extends MyItemsState{
  MyItemsLoadedState(super.products);
}
class MyItemsErrorState extends MyItemsState{
  String message;
  MyItemsErrorState(super.products,this.message);
}
