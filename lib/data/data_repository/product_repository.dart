import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/api.dart';
import '../model/product_model.dart';

class ProductRepository {
  Api _api = Api();

  Future<List<ProductModel>> FetchAllProduct(String BEARER_TOKEN) async {
    try {
      Response response = await _api.sendRequest.get(
          'user/listing/showAllListing',
          options: Options(headers: {'Authorization': BEARER_TOKEN}));
      ApiResponse apiResponse = ApiResponse.fromResponse(response);
      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }
      return (apiResponse.data as List<dynamic>)
          .map((json) => ProductModel.fromJson(json))
          .toList();
    } catch (error) {
      rethrow;
    }
  }

  Future<List<ProductModel>> FetchMyItems(String userId,String BEARER_TOKEN) async {
    try {
      Response response = await _api.sendRequest.get(
          'user/profile/listings/${userId}',
          options: Options(headers: {'Authorization': BEARER_TOKEN}));
      ApiResponse apiResponse = ApiResponse.fromResponse(response);
      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }
      return (apiResponse.data as List<dynamic>)
          .map((json) => ProductModel.fromJson(json))
          .toList();
    } catch (error) {
      rethrow;
    }
  }

  // Future<List<ProductModel>> FetchProductByCategory(
  //     String categoryId, String TOKEN) async {
  //   try {
  //     Response response = await _api.sendRequest.get(
  //       'user/listing/getListing/category/${categoryId}',
  //       options: Options(headers: {'Authorization': TOKEN}),
  //     );
  //     ApiResponse apiResponse = ApiResponse.fromResponse(response);
  //     if (!apiResponse.success) {
  //       throw apiResponse.message.toString();
  //     }
  //     return (apiResponse.data as List<dynamic>).map((json) => ProductModel.fromJson(json)).toList();
  //   } catch (error) {
  //     rethrow;
  //   }
  // }
  Future<List<ProductModel>> FetchProductByCategory(
      String categoryId, String TOKEN) async {
    try {
      Response response = await _api.sendRequest.get(
        'user/listing/getListing/category/${categoryId}',
        options: Options(headers: {'Authorization': TOKEN}),
      );
      ApiResponse apiResponse = ApiResponse.fromResponse(response);
      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }
      log('product by categ-after success');
      return (apiResponse.data as List<dynamic>).map((json) => ProductModel.fromJson(json)).toList();
    } catch (error) {
      log('product by categ-error${error.toString()}');
      rethrow;
    }
  }

  Future<ProductModel> AddProducts(
      ProductModel productModel, String BEARER_TOKEN) async {
    try {
      Response response = await _api.sendRequest.post(
        'user/listing/create',
        options: Options(headers: {'Authorization': BEARER_TOKEN}),
        data: jsonEncode(productModel.toJson(),),
      );
      // log(productModel.toJson().toString());
      ApiResponse apiResponse = ApiResponse.fromResponse(response);
      if (!apiResponse.success) {
        log(apiResponse.message.toString());
        throw apiResponse.message.toString();
      }
      return ProductModel.fromJson(apiResponse.data);
    } catch (error) {
      rethrow;
    }
  }
}
