
import 'package:sellingportal/data/model/product_model.dart';

abstract class ProductUploadState {

}

class ProductUploadInitialState extends ProductUploadState {

}

class ProductUploadLoadingState extends ProductUploadState {

}

class ProductUploadedState extends ProductUploadState {
  ProductModel productModel;
  ProductUploadedState(this.productModel);

}

class ProductUploadErrorState extends ProductUploadState {
  String message;

  ProductUploadErrorState(this.message);
}
