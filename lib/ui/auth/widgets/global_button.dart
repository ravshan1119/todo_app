import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/colors.dart';
class GlobalButton extends StatelessWidget {
  const GlobalButton({Key? key, required this.title, required this.onTap})
      : super(key: key);

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          color: AppColors.C_3669C9,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.white,
              fontSize: 18.sp,
              fontFamily: "LeagueSpartan",
            ),
          ),
        ),
      ),
    );
  }
}