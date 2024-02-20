import 'package:sellingportal/data/model/product_model.dart';

class MyWishListModel {
  //custom.
  ProductModel? product;
  //

  String? sId;

  MyWishListModel({ this.sId,this.product});

  MyWishListModel.fromJson(Map<String, dynamic> json) {
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
