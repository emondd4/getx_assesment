import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_assesment/models/CategoryListResponse.dart';
import 'package:getx_assesment/models/ProductListBaseResponse.dart';

import '../network/api_repository.dart';
import '../utils/AppCommonUtil.dart';
import '../utils/UiUtil.dart';

class HomeController extends GetxController {

  final ApiRepository _apiRepository = ApiRepository();
  RxBool isCategoryDataLoading = true.obs;
  RxBool isProductDataLoading = true.obs;
  RxList<CategoryListResponse> categoryList = <CategoryListResponse>[].obs;
  Rx<ProductListBaseResponse> productList = ProductListBaseResponse().obs;
  String selectedCategory = '';
  final TextEditingController searchController = TextEditingController();


  @override
  void onInit() {
  getCategoryList();
    super.onInit();
  }

  void showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => StatefulBuilder(
        builder: (context, setModalState) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Wrap(
              runSpacing: 10,
              spacing: 10,
              children: categoryList
                  .map(
                    (category) => ChoiceChip(
                  label: Text(category.name.toString()),
                  selected: selectedCategory == category.slug,
                  onSelected: (bool selected) {
                    setModalState(() {
                      selectedCategory = category.slug!;
                    });
                    getCategoryProductList(selectedCategory);
                    Navigator.pop(context);
                  },
                ),
              )
                  .toList(),
            ),
          );
        },
      ),
    );
  }

  ///Api Calls
  Future getCategoryList() async {

    CommonUtil.instance.internetCheck().then((value) async {
      if (value) {
        _apiRepository.categoryList(Get.context!, null,null,
            onSuccess: (List<CategoryListResponse> response) async {
              categoryList.value = response;
              getProductList();
            },
            onFailure: (String error) {
              UIUtil.instance.onFailed(error);
            });
      } else {
        UIUtil.instance.onNoInternet();
      }
    });
  }

  Future getProductList() async {

    CommonUtil.instance.internetCheck().then((value) async {
      if (value) {
        UIUtil.instance.showLoading();
        _apiRepository.getProductList(Get.context!, null,null,
            onSuccess: (ProductListBaseResponse response) async {
              productList.value = response;
              UIUtil.instance.stopLoading();
            },
            onFailure: (String error) {
              UIUtil.instance.stopLoading();
              UIUtil.instance.onFailed(error);
            });
      } else {
        UIUtil.instance.onNoInternet();
      }
    });
  }

  Future getQueryProductList(String query) async {

    Map<String,dynamic> temp = {"q":query};

    CommonUtil.instance.internetCheck().then((value) async {
      if (value) {
        UIUtil.instance.showLoading();
        _apiRepository.getSearchProductList(Get.context!, temp,null,
            onSuccess: (ProductListBaseResponse response) async {
              productList.value = response;
              UIUtil.instance.stopLoading();
            },
            onFailure: (String error) {
              UIUtil.instance.stopLoading();
              UIUtil.instance.onFailed(error);
            });
      } else {
        UIUtil.instance.onNoInternet();
      }
    });
  }

  Future getCategoryProductList(String category) async {
    CommonUtil.instance.internetCheck().then((value) async {
      if (value) {
        UIUtil.instance.showLoading();
        _apiRepository.getCategoryProductList(Get.context!, category,null,null,
            onSuccess: (ProductListBaseResponse response) async {
              productList.value = response;
              UIUtil.instance.stopLoading();
            },
            onFailure: (String error) {
              UIUtil.instance.stopLoading();
              UIUtil.instance.onFailed(error);
            });
      } else {
        UIUtil.instance.onNoInternet();
      }
    });
  }

}