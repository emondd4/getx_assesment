import 'package:flutter/material.dart';
import 'package:getx_assesment/models/CategoryListResponse.dart';
import 'package:getx_assesment/models/ProductListBaseResponse.dart';
import 'api_client.dart';
import 'api_urls.dart';

class ApiRepository {

  /// Get Product List
  void getProductList(BuildContext context,
      Map<String, dynamic>? params, Map<String, dynamic>? body,
      {void Function(ProductListBaseResponse)? onSuccess,
      void Function(String)? onFailure}) async {
    try {
      final response = await ApiClient.get(
          "${ApiUrls.baseUrl}${ApiUrls.productList}",
          params,
          true,
          false);
      var callResponse =  ProductListBaseResponse.fromJson(response);
      onSuccess!(callResponse);
        } catch (e) {
      debugPrint(e.toString());
      onFailure!("Something Went Wrong");
    }
  }

  void getCategoryProductList(BuildContext context,String category,
      Map<String, dynamic>? params, Map<String, dynamic>? body,
      {void Function(ProductListBaseResponse)? onSuccess,
        void Function(String)? onFailure}) async {
    try {
      final response = await ApiClient.get(
          "${ApiUrls.baseUrl}${ApiUrls.categoryProductList}$category",
          params,
          true,
          false);
      var callResponse =  ProductListBaseResponse.fromJson(response);
      onSuccess!(callResponse);
    } catch (e) {
      debugPrint(e.toString());
      onFailure!("Something Went Wrong");
    }
  }

  void getSearchProductList(BuildContext context,
      Map<String, dynamic>? params, Map<String, dynamic>? body,
      {void Function(ProductListBaseResponse)? onSuccess,
        void Function(String)? onFailure}) async {
    try {
      final response = await ApiClient.get(
          "${ApiUrls.baseUrl}${ApiUrls.searchProductList}",
          params,
          true,
          false);
      var callResponse =  ProductListBaseResponse.fromJson(response);
      onSuccess!(callResponse);
    } catch (e) {
      debugPrint(e.toString());
      onFailure!("Something Went Wrong");
    }
  }

  ///Product Category List
  void categoryList(BuildContext context,
      Map<String, dynamic>? params, Map<String, dynamic>? body,
      {void Function(List<CategoryListResponse>)? onSuccess,
      void Function(String)? onFailure}) async {
    try {
      final response = await ApiClient.getList(
          "${ApiUrls.baseUrl}${ApiUrls.categoryList}",
          params,
          true,
          false);
          var callResponse = (response as List)
              .map((x) => CategoryListResponse.fromJson(x))
              .toList();
      onSuccess!(callResponse);
        } catch (e) {
      debugPrint(e.toString());
      onFailure!("Something Went Wrong");
    }
  }

}
