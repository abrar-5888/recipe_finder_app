import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:new_app/app/modules/fav_page/fav_page_controller.dart';
import 'package:new_app/data/model/recipe_model.dart';

class HiveDb {
  HiveDb._();

  static void saveRecipeToHive(RecipeModel recipe) async {
    var box = await Hive.openBox<RecipeModel>('recipes');
    await box.put(recipe.id, recipe);
    Get.put(FavPageController()).update();
    Get.snackbar("New App", "Recipe Added to Favourites", snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
  }

  static Future<RecipeModel?> getRecipeFromHive(int id) async {
    var box = await Hive.openBox<RecipeModel>('recipes');
    return box.get(id);
  }

  static void removeRecipeFromHive(int id) async {
    var box = await Hive.openBox<RecipeModel>('recipes');
    await box.delete(id); // Remove recipe by id
    Get.snackbar("New App", "Recipe Removed from Favourites", snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
  }
}
