
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

    } on DioException catch(ex) {
      switch(ex.type){
        case DioExceptionType.connectionTimeout:
          throw 'Server not responding';
        case DioExceptionType.connectionError:
          throw 'Server not responding';
        case DioExceptionType.sendTimeout:
          throw 'Check network connection';
        case DioExceptionType.receiveTimeout:
          throw 'Check network connection';
        case DioExceptionType.badCertificate:
          throw 'badCertificate';
        case DioExceptionType.badResponse:
          throw 'Bad Response';
        case DioExceptionType.cancel:
          throw 'cancel';
        case DioExceptionType.unknown:
          throw 'Some Error occured';


      }
    }
  }

}