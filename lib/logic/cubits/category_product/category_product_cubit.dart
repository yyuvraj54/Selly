import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:sellingportal/logic/cubits/user/userToke.dart';

import '../../../data/data_repository/product_repository.dart';
import '../../../data/model/category_model.dart';
import 'category_product_state.dart';

class CategoryProductCubit extends Cubit<CategoryProductState> {
  final CategoryModel category;
  CategoryProductCubit(this.category) : super( CategoryProductInitialState() ) {
    _initialize();
  }

  final _productRepository = ProductRepository();

  void _initialize() async {
    emit( CategoryProductLoadingState(state.products) );
    try {
      log(UserToken.token!);
      final products = await _productRepository.FetchProductByCategory(category.sId!, UserToken.token!);
      products.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
      emit( CategoryProductLoadedState(products));
    }
    catch(ex) {
      emit( CategoryProductErrorState(ex.toString(), state.products) );
    }
  }
}