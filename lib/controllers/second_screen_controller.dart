import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model_view/api_helper/api_helper.dart';
import '../model_view/model/food_detail+model.dart';

class SecondScreenController extends GetxController {
  RxInt currentIndex = 0.obs;

  void setCurrentIndex(int index) {
    currentIndex.value = index;
  }

  Rx<FoodDetailModel> fooData = FoodDetailModel().obs;
  void getRecipeData(int id) async {
    try {
      ApiHandler apiResponse = await ApiCalling.getApi(uri: 'https://dummyjson.com/recipes/$id');
      if (apiResponse.response != null) {
         fooData.value = FoodDetailModel.fromJson(apiResponse.response);
      } else {
        showSnackBar(apiResponse.error?.message ?? "");
      }
    } catch (e) {
      showSnackBar(e.toString());
    }
  }



  void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  @override
  void onInit() {
    getRecipeData.call(Get.arguments['id']);
    super.onInit();
  }
}
