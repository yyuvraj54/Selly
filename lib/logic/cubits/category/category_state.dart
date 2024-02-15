
import '../../../data/model/category_model.dart';

abstract class CategoryState {
  //we can initialse this abstract class with some data that will be common to all the
  //states
  //in our case List of categories is common
  List<CategoryModel> categories;

  CategoryState(this.categories);
}

class CategoryInitialState extends CategoryState {
  CategoryInitialState() : super([]);
}

class CategoryLoadingState extends CategoryState {
  CategoryLoadingState(super.categories);
}

class CategoryLoadedState extends CategoryState {
  CategoryLoadedState(super.categories);
}

class CategoryErrorState extends CategoryState {
  final String message;

  CategoryErrorState(super.categories, this.message);
}
