import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomBarContainerWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  const BottomBarContainerWidget({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 120.w,
      duration: const Duration(seconds: 1),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r), color: Colors.amber[100]),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.brown,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w500),
          )
        ],
      ).paddingAll(8),
    );
  }
}
