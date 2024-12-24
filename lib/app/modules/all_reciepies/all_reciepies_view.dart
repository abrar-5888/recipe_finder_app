import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_app/app/components/input_text_fields.dart';
import 'package:new_app/app/modules/home_page/home_page_controller.dart';
import 'package:new_app/app/modules/reciepe_detail/reciepe_detail_view.dart';

class AllReciepiesView extends StatelessWidget {
  const AllReciepiesView({super.key});

  @override
  Widget build(BuildContext context) {
    var logic = Get.put<HomePageController>(HomePageController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(8.w, 20.h, 8.w, 0),
        child: Column(
          children: [
            Center(
              child: Text(
                "All Recipies",
                style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            SizedBox(
              height: 40.h,
              child: InputTextFields(
                height: 40,
                labelText: "Search",
                onChanged: logic.onChange,
                suffixIcon: const Icon(Icons.search),
              ),
            ),
            Expanded(
              child: Obx(() => GridView.builder(
                    scrollDirection: Axis.vertical,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 3 / 5,
                    ),
                    padding: EdgeInsets.all(8.w),
                    itemBuilder: (context, index) {
                      var recipe = logic.filterRecipies[index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => ReciepeDetailView(
                                recipe: recipe,
                                isFvrt: false,
                              ));
                        },
                        child: Card(
                          color: Colors.white,
                          surfaceTintColor: Colors.white,
                          child: Column(
                            children: <Widget>[
                              SizedBox(
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
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 5.h),
                                      Text(
                                        recipe.name,
                                        style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w500, color: Colors.black),
                                      ),
                                      SizedBox(height: 5.h),
                                      Text(
                                        recipe.mealType.join(", "),
                                        style: GoogleFonts.poppins(fontSize: 10.sp, fontWeight: FontWeight.w500, color: Colors.grey),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 10.h),
                                      Row(
                                        children: [
                                          Icon(Icons.timelapse_outlined, color: Colors.grey, size: 16.sp),
                                          SizedBox(width: 5.w),
                                          Text(
                                            "${recipe.prepTimeMinutes}-${recipe.cookTimeMinutes} minutes",
                                            style: GoogleFonts.poppins(fontSize: 9.sp, fontWeight: FontWeight.w500, color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5.h),
                                      Row(
                                        children: [
                                          Icon(Icons.auto_awesome_rounded, color: Colors.grey, size: 16.sp),
                                          SizedBox(width: 5.w),
                                          Text(
                                            recipe.difficulty,
                                            style: GoogleFonts.poppins(fontSize: 9.sp, fontWeight: FontWeight.w500, color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: logic.filterRecipies.length,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
