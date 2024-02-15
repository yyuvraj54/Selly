import 'package:sellingportal/data/model/product_model.dart';

class CartItemModel {
  //custom.
  ProductModel? product;
  //

  String? sId;

  CartItemModel({ this.sId,this.product});

  CartItemModel.fromJson(Map<String, dynamic> json) {
    //
    product = ProductModel.fromJson(json['product']);
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    //
    data['product'] = product!.sId;
    //
    data['_id'] = this.sId;
    return data;
  }
}
