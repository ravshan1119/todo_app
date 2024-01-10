import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';

class GlobalTextField extends StatefulWidget {
  GlobalTextField({
    Key? key,
    required this.hintText,
    required this.keyboardType,
    required this.textInputAction,
    required this.textAlign,
    required this.controller,
    this.obscureText = false,
    this.maxLine=1,
  }) : super(key: key);

  final String hintText;
  TextInputType keyboardType;
  TextInputAction textInputAction;
  TextAlign textAlign;
  final bool obscureText;
  TextEditingController controller;
  int maxLine;

  @override
  State<GlobalTextField> createState() => _GlobalTextFieldState();
}

class _GlobalTextFieldState extends State<GlobalTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.C_0C1A30,
          fontFamily: "DMSans"),
      textAlign: widget.textAlign,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      controller: widget.controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        hintText: widget.hintText,
        hintStyle: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.c_C4C5C4,
            fontFamily: "DMSans"),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.c_13181F,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.c_13181F,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.c_13181F,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.c_13181F,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.c_13181F,
          ),
        ),
      ),
    );
  }
}
