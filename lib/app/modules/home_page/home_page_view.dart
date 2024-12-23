import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_app/app/components/recipe_component.dart';
import 'package:new_app/app/modules/home_page/home_page_controller.dart';
import 'package:new_app/configs/images.dart';
import 'package:new_app/data/model/recipe_model.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (logic) {
        return Obx(() => logic.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.amber,
                ),
              )
            : SingleChildScrollView(
                child: SizedBox(
                  height: Get.height,
                  child: IntrinsicHeight(
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Container(
                                height: 150.h,
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 16.h),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 8.w),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Hello, Joana",
                                            style: GoogleFonts.poppins(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            "What do you want to cook today?",
                                            style: GoogleFonts.poppins(
                                              fontSize: 14.sp,
                                              color: Colors.black.withOpacity(0.7),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      CircleAvatar(
                                        radius: 20.r,
                                        backgroundColor: Colors.black,
                                        child: Icon(Icons.person, color: Colors.white, size: 18.sp),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 70.h,
                          left: 20.w,
                          right: 20.w,
                          child: Card(
                            color: Colors.white,
                            elevation: 10,
                            surfaceTintColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                            child: Column(mainAxisAlignment: MainAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: <Widget>[
                              ListTile(
                                title: Text("Recipes Recomendation", style: GoogleFonts.poppins(color: Colors.black, fontSize: 14.sp)),
                                subtitle: Text("Get your personalized recipes recommendation in a 4 steps", style: GoogleFonts.poppins(color: Colors.grey, fontSize: 12.sp)),
                                trailing: Image.asset(AssetImages.recipeImage),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(backgroundColor: Colors.amber.shade200, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                                          onPressed: () {},
                                          child: Text("Get Started", style: GoogleFonts.poppins(fontSize: 14.sp, color: Colors.brown, fontWeight: FontWeight.w500))),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(backgroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                                          onPressed: () {},
                                          child: Text("Skip", style: GoogleFonts.poppins(fontSize: 14.sp, color: Colors.black, fontWeight: FontWeight.w500))),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                            ]),
                          ),
                        ),
                        Positioned(
                          top: 230.h,
                          left: 20.w,
                          right: 20.w,
                          child: Container(
                            height: 380.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Popular Recipies",
                                      style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.bold),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        "See all",
                                        style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.orange.shade400),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        height: 330.h,
                                        width: 330.w,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 15,
                                          itemBuilder: (context, index) {
                                            RecipeModel recipe = logic.recipes[index];

                                            return RecipeComponent(recipe: recipe);
                                          },
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 600.h,
                          left: 20.w,
                          right: 20.w,
                          child: Container(
                            height: 300.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Popular Creators",
                                      style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "See all",
                                      style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.orange.shade400),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        height: 170.h,
                                        width: 330.w,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 6,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                                              child: Card(
                                                surfaceTintColor: Colors.white,
                                                color: Colors.white,
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.sp),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      // SizedBox(
                                                      //     height: 120.h,
                                                      //     child: ClipRRect(
                                                      //         borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                                                      //         child: Image.asset(AssetImages.recipeImage))),
                                                      // SizedBox(
                                                      //   height: 5.h,
                                                      // ),
                                                      CircleAvatar(
                                                        radius: 20.r,
                                                        backgroundColor: Colors.blue,
                                                      ),
                                                      SizedBox(
                                                        height: 5.h,
                                                      ),
                                                      Text(
                                                        "James Nikidaw",
                                                        style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w500, color: Colors.black),
                                                      ),
                                                      SizedBox(
                                                        height: 10.h,
                                                      ),

                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.note_alt_sharp,
                                                            color: Colors.grey,
                                                            size: 16.sp,
                                                          ),
                                                          SizedBox(
                                                            width: 5.w,
                                                          ),
                                                          Text(
                                                            "124",
                                                            style: GoogleFonts.poppins(fontSize: 10.sp, fontWeight: FontWeight.w500, color: Colors.grey),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5.h,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.favorite_border_outlined,
                                                            color: Colors.grey,
                                                            size: 16.sp,
                                                          ),
                                                          SizedBox(
                                                            width: 5.w,
                                                          ),
                                                          Text(
                                                            "41291",
                                                            style: GoogleFonts.poppins(fontSize: 10.sp, fontWeight: FontWeight.w500, color: Colors.grey),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5.h,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
      },
    );
  }
}
