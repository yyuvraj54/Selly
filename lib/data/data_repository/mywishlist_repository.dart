import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sellingportal/core/api.dart';
import 'package:sellingportal/data/model/my_wishlist_model.dart';
import 'package:sellingportal/logic/cubits/user/userToke.dart';

class MyWishListRepository {
  Api _api = Api();
  String userId = UserToken.id!;

  Future<List<MyWishListModel>> FetchWishList() async {
    try {
      Response response = await _api.sendRequest.get(
        'user/wishlist/${userId}',
        options: Options(
          headers: {'Authorization': UserToken.token},
        ),
      );
      ApiResponse apiResponse = ApiResponse.fromResponse(response);
      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }
      log(apiResponse.data.toString());
      if(apiResponse.data !=null){
        return (apiResponse.data as List<dynamic>)
            .map((json) => MyWishListModel.fromJson(json))
            .toList();
      }
      else{
        throw apiResponse.message.toString();
      }

    } catch (error) {
      rethrow;
    }
  }


  Future<List<MyWishListModel>> addToCart(MyWishListModel cartItem) async {
    try {
      Map<String, dynamic> data = cartItem.toJson();
      data["user"] = UserToken.id;

      Response response = await _api.sendRequest.post(
          "user/wishlist/",
          data: jsonEncode(data)
      );

      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if(!apiResponse.success) {
        throw apiResponse.message.toString();
      }

      return (apiResponse.data as List<dynamic>).map((json) => MyWishListModel.fromJson(json)).toList();
    }
    catch(ex) {
      rethrow;
    }
  }




  Future<List<MyWishListModel>> removeFromCart(
      String productId) async {
    try {
      Map<String, dynamic> data = {'user': UserToken.id, "product": productId};
      Response response =
      await _api.sendRequest.delete('user/wishlist/', data: jsonEncode(data));
      ApiResponse apiResponse = ApiResponse.fromResponse(response);
      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }
      return (apiResponse.data as List<dynamic>)
          .map((json) => MyWishListModel.fromJson(json))
          .toList();
    } catch (error) {
      rethrow;
    }
  }

}
