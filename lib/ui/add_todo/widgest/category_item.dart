import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../models/todo_model/todo_category.dart';
import '../../../utils/colors.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {Key? key,
      required this.toDoCategory,
      required this.isSelected,
      required this.onSelected})
      : super(key: key);
  final ToDoCategory toDoCategory;
  final bool isSelected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Color(
                          int.parse("0xFF${toDoCategory.colorInString}"))),
                  height: 64.h,
                  width: 64.h,
                  child: Center(
                    child: SvgPicture.asset(toDoCategory.iconPath),
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  toDoCategory.categoryName,
                  style: Theme.of(context).textTheme.titleSmall,
                )
              ],
            ),
          ),
          Positioned(
            top: 12,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: isSelected
                    ? AppColors.C_979797.withOpacity(0.8)
                    : Colors.transparent,
              ),
              height: 64.h,
              width: 64.h,
              child: isSelected
                  ? const Icon(
                      Icons.done,
                      color: Colors.white,
                      size: 40,
                    )
                  : const SizedBox(),
            ),
          )
        ],
      ),
    );
  }
}
