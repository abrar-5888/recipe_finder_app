import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_app/data/model/recipe_model.dart';

class FavPageController extends GetxController {
  var favoriteRecipes = <RecipeModel>[];
  var filterRecipies = <RecipeModel>[].obs;
  var isLoading=false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllRecipes();
  }

  Future<void> fetchAllRecipes() async {
    isLoading.value=true;
    var box = await Hive.openBox<RecipeModel>('recipes');
    favoriteRecipes.clear();

    favoriteRecipes.addAll(box.values.toList());
    filterRecipies.assignAll(favoriteRecipes);
     isLoading.value=false;
    update();
  }

 Future<void> onRefresh()async{
  await fetchAllRecipes();
}
  void onChange(String value) {
    if (value.isNotEmpty) {
      filterRecipies.assignAll(favoriteRecipes.where((e) => e.name.toLowerCase().contains(value.toLowerCase())));
    } else {
      filterRecipies.assignAll(favoriteRecipes);
    }
  }
}
