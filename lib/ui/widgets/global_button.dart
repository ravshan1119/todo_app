import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';

class GetGlobalButton extends StatefulWidget {
  const GetGlobalButton(
      {super.key,
      required this.text,
      this.username = false,
      this.password = false,
      required this.onTap,
      this.confirmPassword = true,
      this.isSignUp = false});

  final String text;
  final bool username;
  final bool password;
  final bool isSignUp;
  final bool confirmPassword;
  final VoidCallback onTap;

  @override
  State<GetGlobalButton> createState() => _GetGlobalButtonState();
}

class _GetGlobalButtonState extends State<GetGlobalButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 48.h,
        width: 327.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          color: AppColors.C_8687E7,
        ),
        child: Center(
          child: Text(
            widget.text,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
