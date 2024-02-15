import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:sellingportal/logic/cubits/products/productUpload_state.dart';

import '../../../data/data_repository/product_repository.dart';
import '../../../data/model/product_model.dart';

class ProductUploadCubit extends Cubit<ProductUploadState>{
  ProductUploadCubit():super(ProductUploadInitialState());
  final ProductRepository _productRepository = ProductRepository();
  void addToProductListings( ProductModel productModel, String BEARER_TOKEN) async {
    emit(ProductUploadInitialState());
    try {
     emit(ProductUploadLoadingState());
      final addedProduct = await _productRepository.AddProducts(productModel, BEARER_TOKEN);
      emit(ProductUploadedState(addedProduct));

    } catch (error) {
      log('in produpload cubit, error: ${error.toString()}');
      emit(ProductUploadErrorState(error.toString()));
    }
  }
}

