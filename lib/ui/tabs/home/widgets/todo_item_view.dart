import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../models/todo_model/todo_importance.dart';
import '../../../../models/todo_model/todo_model.dart';
import '../../../../models/todo_model/todo_status.dart';

class ToDoItemView extends StatelessWidget {
  const ToDoItemView({
    Key? key,
    required this.toDoModel,
    required this.onSelect,
    required this.onCancelTap,
  }) : super(key: key);

  final ToDoModel toDoModel;
  final VoidCallback onSelect;
  final VoidCallback onCancelTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 24,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Theme.of(context).cardColor,
        border: Border.all(
          width: 1.5,
          color: getBorderColor(toDoModel.toDoImportance),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            toDoModel.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                toDoModel.expiredDate,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
              SizedBox(width: 12.w),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color(
                      int.parse("0xFF${toDoModel.category.colorInString}")),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      toDoModel.category.iconPath,
                      width: 18.w,
                      height: 18.w,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      toDoModel.category.categoryName,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 13.sp,
                          ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: (toDoModel.status!=ToDoStatus.canceled)&&(toDoModel.status!=ToDoStatus.completed),
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).canvasColor),
                  onPressed: onCancelTap,
                  child: Text(
                    "Cancel",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              Text(
                toDoModel.status.name.toUpperCase(),
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Visibility(
                visible: (toDoModel.status!=ToDoStatus.canceled)&&(toDoModel.status!=ToDoStatus.completed),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: onSelect,
                  child: Text(
                    "Done",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color getBorderColor(ToDoImportance toDoImportance) {
    switch (toDoImportance) {
      case ToDoImportance.urgent:
        return Colors.yellowAccent;
      case ToDoImportance.veryUrgent:
        return Colors.redAccent;
      case ToDoImportance.normal:
        return Colors.green;
    }
  }
}
