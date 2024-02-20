
import 'dart:core';
import 'dart:developer';
import 'package:dio/dio.dart';


import '../../core/api.dart';
import '../model/category_model.dart';
class CategoryRepository {
  CategoryRepository();

// Map<String,dynamic> HEADERS={
//   'content-type':'application/json',
//   'Authorization':BEARER_TOKEN
// }
  final Api _api = Api();

  Future <List<CategoryModel>> FetchAllCategory(String BEARER_TOKEN) async {
    try {

      Response response = await _api.sendRequest.get(
        'admin/Prop/category',
        options: Options(headers:{'Authorization':BEARER_TOKEN} )
      );
      ApiResponse apiResponse = ApiResponse.fromResponse(response);
       log('categ-repo');
      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }
      log('categ-repo-after success');
      final categoryList  = (apiResponse.data as List<dynamic>).map((json) =>  CategoryModel.fromJson(json)).toList();
      log('categ-repo-after list conversion');
      return categoryList;

    } catch (error) {
      rethrow;
    }
  }

}