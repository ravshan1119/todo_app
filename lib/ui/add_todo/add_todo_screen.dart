import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/ui/add_todo/widgest/category_item.dart';
import 'package:todo_app/ui/add_todo/widgest/select_importance.dart';

import '../../data/app_repository.dart';
import '../../models/todo_model/todo_category.dart';
import '../../models/todo_model/todo_importance.dart';
import '../../models/todo_model/todo_model.dart';
import '../../models/todo_model/todo_status.dart';
import '../../utils/ui_itils.dart';
import '../widgets/global_button.dart';
import '../widgets/universal_input_text.dart';


class AddToDoScreen extends StatefulWidget {
  const AddToDoScreen({Key? key, required this.onAdded}) : super(key: key);

  final ValueChanged<ToDoModel> onAdded;

  @override
  State<AddToDoScreen> createState() => _AddToDoScreenState();
}

class _AddToDoScreenState extends State<AddToDoScreen> {
  List<ToDoModel> todos = [];
  int selectedCategoryIndex = -1;
  DateTime selectedDate = DateTime.now();
  TimeOfDay? timeOfDay =
      TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);
  ToDoImportance importance = ToDoImportance.normal;

  ToDoModel toDoModel = ToDoModel(
    expiredDate: "",
    description: "",
    title: "",
    createdAt: "",
    category: ToDoCategory(
      id: 0,
      categoryName: "",
      iconPath: "",
      colorInString: "",
    ),
    status: ToDoStatus.inProgress,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add to do"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                UniversalInputView(
                  caption: "Add Title",
                  hintText: "Enter titles",
                  inputType: TextInputType.text,
                  onChanged: (v) {
                    toDoModel = toDoModel.copyWith(title: v);
                  },
                  initialValue: "",
                ),
                UniversalInputView(
                  isBigText: true,
                  caption: "Add description",
                  hintText: "Enter description ",
                  inputType: TextInputType.text,
                  onChanged: (v) {
                    toDoModel = toDoModel.copyWith(description: v);
                  },
                  initialValue: "",
                ),
                SizedBox(height: 12.h),
                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children:
                        List.generate(AppRepository.categories.length, (index) {
                      ToDoCategory category = AppRepository.categories[index];
                      return CategoryItem(
                        onSelected: () {
                          setState(
                            () {
                              selectedCategoryIndex = index;
                              toDoModel = toDoModel.copyWith(
                                category: AppRepository
                                    .categories[selectedCategoryIndex],
                              );
                            },
                          );
                        },
                        isSelected: selectedCategoryIndex == index,
                        toDoCategory: category,
                      );
                    }),
                  ),
                ),
                SelectImportance(
                  important: (imp) {
                    importance = imp;
                  },
                ),
                SizedBox(
                  height: 24.h,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: () async {
                      selectedDate = (await showDatePicker(
                        context: context,
                        initialEntryMode: DatePickerEntryMode.calendar,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(DateTime.now().year - 1),
                        lastDate: DateTime(DateTime.now().year + 10),
                      ))!;

                      if (context.mounted) {
                        timeOfDay = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay(
                            hour: DateTime.now().hour,
                            minute: DateTime.now().minute,
                          ),
                        );

                        selectedDate = selectedDate.copyWith(
                          hour: timeOfDay!.hour,
                          minute: timeOfDay!.minute,
                        );

                        print("FINAL DATE:${selectedDate}");
                      }
                    },
                    child: Text(selectedDate.toString()),
                  ),
                ),
                SizedBox(
                  height: 32.h,
                )
              ],
            ),
          ),
          SizedBox(height: 12.h),
          GetGlobalButton(
            text: "Add To Do",
            onTap: () {
              toDoModel = toDoModel.copyWith(toDoImportance: importance);
              toDoModel = toDoModel.copyWith(
                expiredDate: selectedDate.toString(),
                createdAt: DateTime.now().toString(),
              );
              if (toDoModel.canAddThis().isEmpty) {
                widget.onAdded.call(toDoModel);
                Navigator.pop(context);
              } else {
                showMessage(toDoModel.canAddThis());
              }
            },
          ),
          SizedBox(height: 24.h)
        ],
      ),
    );
  }
}
