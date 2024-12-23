import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_app/data/model/recipe_model.dart';

class RecipeComponent extends StatelessWidget {
  final RecipeModel recipe;
  const RecipeComponent({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Padding(
                                              padding: EdgeInsets.symmetric(vertical: 8.h),
                                              child: SizedBox(
                                                width: 170.w,
                                                child: Card(
                                                  surfaceTintColor: Colors.white,
                                                  color: Colors.white,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      SizedBox(
                                                        width: 170.w,
                                                        // height: 120.h,
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
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5.h,
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                                                        child: Text(
                                                          recipe.name,
                                                          style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w500, color: Colors.black),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5.h,
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                                                        child: Text(
                                                          recipe.mealType.join(", "),
                                                          style: GoogleFonts.poppins(fontSize: 10.sp, fontWeight: FontWeight.w500, color: Colors.grey),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10.h,
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons.timelapse_outlined,
                                                              color: Colors.grey,
                                                              size: 16.sp,
                                                            ),
                                                            SizedBox(
                                                              width: 5.w,
                                                            ),
                                                            Text(
                                                              "${recipe.prepTimeMinutes}-${recipe.cookTimeMinutes} minutes",
                                                              style: GoogleFonts.poppins(fontSize: 9.sp, fontWeight: FontWeight.w500, color: Colors.grey),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5.h,
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons.auto_awesome_rounded,
                                                              color: Colors.grey,
                                                              size: 16.sp,
                                                            ),
                                                            SizedBox(
                                                              width: 5.w,
                                                            ),
                                                            Text(
                                                              recipe.difficulty,
                                                              style: GoogleFonts.poppins(fontSize: 9.sp, fontWeight: FontWeight.w500, color: Colors.grey),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5.h,
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                                                        child: Row(
                                                          children: [
                                                            CircleAvatar(
                                                              radius: 8.r,
                                                              backgroundColor: Colors.blue,
                                                            ),
                                                            SizedBox(
                                                              width: 5.w,
                                                            ),
                                                            Text(
                                                              "Miriam berina",
                                                              style: GoogleFonts.poppins(fontSize: 9.sp, fontWeight: FontWeight.w500, color: Colors.grey),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
  }
}