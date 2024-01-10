import 'package:flutter/material.dart';

import '../../../models/todo_model/todo_importance.dart';
import '../../../utils/colors.dart';

class SelectImportance extends StatefulWidget {
  const SelectImportance({Key? key, required this.important}) : super(key: key);

  final ValueChanged<ToDoImportance> important;

  @override
  State<SelectImportance> createState() => _SelectImportanceState();
}

class _SelectImportanceState extends State<SelectImportance> {
  ToDoImportance? importance = ToDoImportance.normal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            'Normal',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          leading: Radio<ToDoImportance>(
            fillColor: MaterialStateProperty.all(AppColors.white),
            activeColor: AppColors.white,
            value: ToDoImportance.normal,
            groupValue: importance,
            onChanged: (ToDoImportance? value) {
              setState(() {
                importance = value;
                widget.important.call(importance!);
              });
            },
          ),
        ),
        ListTile(
          title: Text(
            'Urgent',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          leading: Radio<ToDoImportance>(
            fillColor: MaterialStateProperty.all(AppColors.white),
            activeColor: AppColors.white,
            value: ToDoImportance.urgent,
            groupValue: importance,
            onChanged: (ToDoImportance? value) {
              setState(() {
                importance = value;
                widget.important.call(importance!);
              });
            },
          ),
        ),
        ListTile(
          title: Text(
            'Very urgent',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          leading: Radio<ToDoImportance>(
            fillColor: MaterialStateProperty.all(AppColors.white),
            activeColor: AppColors.white,
            value: ToDoImportance.veryUrgent,
            groupValue: importance,
            onChanged: (ToDoImportance? value) {
              setState(() {
                importance = value;
                widget.important.call(importance!);
              });
            },
          ),
        ),
      ],
    );
  }
}
