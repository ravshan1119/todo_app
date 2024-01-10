import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageViewItems extends StatelessWidget {
  const PageViewItems(
      {super.key, required this.title, required this.text, required this.img});

  final String title;
  final String text;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          img,
          height: 277.78.sp,
          width: 213.w,
        ),
        SizedBox(height: 101.22.h),
        Text(
          title,
          style: TextStyle(
            fontFamily: "Lato",
            fontSize: 32.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 42.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 36.w),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Lato",
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ),
      ],
    );
  }
}
