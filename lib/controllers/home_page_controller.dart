import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model_view/api_helper/api_helper.dart';
import '../model_view/model/food_data_model.dart';

class HomePageController extends GetxController {
  RxList<Recipe> fooData = <Recipe>[].obs;
  void getRecipeData() async {
    try {
      ApiHandler apiResponse =
          await ApiCalling.getApi(uri: 'https://dummyjson.com/recipes?skip=10');
      if (apiResponse.response != null) {
        FoodDataModel foodModel = FoodDataModel.fromJson(apiResponse.response);
        fooData.value = foodModel.recipes ?? [];
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

  Future<FoodDataModel> getRecipeDataForFuture() async {
    try {
      ApiHandler apiResponse =
          await ApiCalling.getApi(uri: 'https://dummyjson.com/recipes?skip=10');
      if (apiResponse.response != null) {
        return FoodDataModel.fromJson(apiResponse.response);
      } else {
        return FoodDataModel(recipes: []);
      }
    } catch (e) {
      return FoodDataModel(recipes: []);
    }
  }
/// local storage Using SharedPreferences
  void saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("name", "ayush");
    prefs.setString("email", "ayush@gmail.com");
    getData.call();
  }

  RxString name = ''.obs;
  void getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    name.value = prefs.getString("name") ?? "";
  }

  @override
  void onInit() {
    getRecipeData.call();
    getData.call();

    super.onInit();
  }
}
