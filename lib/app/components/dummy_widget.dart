import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DummyWidget extends StatelessWidget {
  final String text;
  const DummyWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(text,style:GoogleFonts.poppins(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w700)),),);
  }
}