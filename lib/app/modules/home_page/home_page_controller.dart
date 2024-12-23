import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:new_app/data/api/api.dart';
import 'package:new_app/data/model/recipe_model.dart';

class HomePageController extends GetxController {
  var recipes = <RecipeModel>[].obs;
  var isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchRecipes();
  }

  void fetchRecipes() async {
    isLoading.value = true;
    var response = await get(Uri.parse(Api.recipeUrl));
    if (response.statusCode == 200) {
      var datas = jsonDecode(response.body);
      for (var data in datas['recipes']) {
        recipes.add(RecipeModel.fromJson(data));
      }
      isLoading.value = false;
      return;
    }
    Get.snackbar("New App", "Please try later!");
    return;
  }
}
