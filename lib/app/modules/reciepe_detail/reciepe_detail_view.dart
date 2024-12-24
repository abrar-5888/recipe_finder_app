import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_app/data/hive/hive_db.dart';
import 'package:new_app/data/model/recipe_model.dart';

class ReciepeDetailView extends StatelessWidget {
  final RecipeModel recipe;
  final bool isFvrt;
  const ReciepeDetailView({super.key, required this.recipe, required this.isFvrt});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          recipe.name,
          style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
        actions: !isFvrt
            ? [
                PopupMenuButton<String>(
                  surfaceTintColor: Colors.white,
                  color: Colors.white,
                  onSelected: (value) async {
                    if (value == 'add_to_favorite') {
                      HiveDb.saveRecipeToHive(recipe);
                    }
                  },
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem<String>(
                      value: 'add_to_favorite',
                      child: Text('Add to Favorite', style: GoogleFonts.poppins(fontSize: 12, color: Colors.black)),
                    ),
                  ],
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.black,
                  ),
                )
              ]
            : null,
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                )),
            child: Padding(
              padding: EdgeInsets.fromLTRB(12.w, 0, 12.w, 0),
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: recipe.image,
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(
                                color: Colors.orange,
                              ),
                            ),
                            errorWidget: (context, url, error) => const Center(
                              child: Icon(Icons.error),
                            ),
                            fit: BoxFit.fitWidth,
                          ))),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.all(6.sp),
                    child: Text("${recipe.name} is ${recipe.difficulty} to make.it's also known as ${recipe.cuisine} ${recipe.tags.join(", ")}.Calories per serving ${recipe.caloriesPerServing}.",
                        style: GoogleFonts.poppins(fontSize: 12.sp, color: Colors.grey)),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(12.w, 0, 12.w, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Ingredients",
                style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            width: Get.width / 1.2,
            height: 270.h,
            child: Card(
              surfaceTintColor: Colors.white,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(right: 4.w),
                child: Scrollbar(
                  controller: scrollController,
                  thumbVisibility: true,
                  thickness: 2,
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      children: List.generate(
                          recipe.ingredients.length,
                          (index) => ListTile(
                                leading: Container(
                                  height: 20.h,
                                  width: 20.w,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), border: Border.all(width: 1, color: Colors.grey)),
                                ),
                                title: Text(
                                  recipe.ingredients[index],
                                  style: GoogleFonts.poppins(fontSize: 12.sp, color: Colors.black54),
                                ),
                              )),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(12.w, 0, 12.w, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Instructions",
                style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            width: 300.w,
            height: 230.h,
            child: Card(
              surfaceTintColor: Colors.white,
              color: Colors.white,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 3,
                      ),
                      title: Text(
                        recipe.instructions[index],
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                        ),
                      ));
                },
                itemCount: recipe.instructions.length,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          )
        ]),
      ),
    );
  }
}
