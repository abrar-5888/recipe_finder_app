
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class InputTextFields extends StatelessWidget {
  final String labelText;
  final IconData? prefixIcon;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final String? initialValue;
  final Widget? suffixIcon;
  final double? height;
  final int? maxLines;

  const InputTextFields({
    super.key,
    required this.labelText,
    this.prefixIcon,
    this.onChanged,
    this.validator,
    this.initialValue,
    this.controller,
    this.onSaved,
    this.suffixIcon,
    this.height,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        height: height ?? 30,
        child: TextFormField(
          textCapitalization: TextCapitalization.sentences,
          maxLines: maxLines ?? 1,
          initialValue: initialValue,
          style:
             GoogleFonts.poppins(fontSize: 12,color: Colors.black),
          controller: controller,
          onChanged: onChanged,
          validator: validator,
          onSaved: onSaved,
        

          // No input formatter if label is not 'Telephone'
          decoration: InputDecoration(
            labelText: labelText,
            suffixIcon: suffixIcon,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.orange, width: 1.0),
              borderRadius: BorderRadius.circular(10),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.orange,
                width: 1.0,
              ),
            ),
            labelStyle: GoogleFonts.poppins(
              color:Colors.black,
              fontSize: 12.0,
            ),
            prefixIcon: prefixIcon == null
                ? null
                : Icon(
                    prefixIcon,
                    color: Colors.orange,
                    size: 14.0,
                  ),
            contentPadding:  const EdgeInsets.all(8.0)
          ),
        ),
      ),
    );
  }
}
