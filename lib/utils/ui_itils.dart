import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../data/app_repository.dart';
import '../models/todo_model/todo_category.dart';
import '../models/todo_model/todo_importance.dart';
import '../models/todo_model/todo_model.dart';
import '../models/todo_model/todo_status.dart';
import '../models/todo_model_for_sql/todo_model_sql.dart';
showMyCustomAlertDialog(BuildContext context, String title) {
  showDialog(
    useSafeArea: true,
    barrierDismissible: false,
    barrierColor: Colors.transparent,
    context: context,
    builder: (context) {
      return AlertDialog(
        alignment: Alignment.center,
        scrollable: true,
        // shadowColor: Colors.transparent,
        // elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: Colors.white,
        title: Text(title),
        content: Column(
          children: [
            Text("Are you sure you want to delete account?"),
            Text("Are you sure you want to delete account?"),
            Text("Are you sure you want to delete account?"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Ok"),
          )
        ],
      );
    },
  );
}

showCustomDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog.fullscreen(
        backgroundColor: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.all(32),
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(32)),
          child: Text("Hello"),
        ),
      );
    },
  );
}

showCupertinoModalPopCustom(BuildContext context) {
  showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          content: Text("Are you sure you want to delete account?"),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: false,
              child: Text("Ok"),
              onPressed: () {},
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text("Cancel"),
              onPressed: () {},
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text("Bilmasam"),
              onPressed: () {},
            ),
          ],
        );
      });
}

showModalCustom(BuildContext context) {
  showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(32),
          topLeft: Radius.circular(32),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(),
          height: MediaQuery.of(context).size.height / 2,
        );
      });
}

void showActionSheet(BuildContext context) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => CupertinoActionSheet(
      title: const Text('Title'),
      message: const Text('Message'),
      actions: <CupertinoActionSheetAction>[
        CupertinoActionSheetAction(
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Default Action'),
        ),
        CupertinoActionSheetAction(
          isDestructiveAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Action'),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        isDestructiveAction: false,
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Destructive Action'),
      ),
    ),
  );
}

showMessage(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.grey,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

class ToDoUtils {
  static ToDoCategory getCategoryById(int categoryId) {
    return AppRepository.categories
        .firstWhere((element) => element.id == categoryId);
  }

  static ToDoStatus getToDoStatus(int index) {
    switch (index) {
      case 0:
        return ToDoStatus.completed;
      case 1:
        return ToDoStatus.inProgress;
      case 2:
        return ToDoStatus.canceled;
      default:
        {
          return ToDoStatus.expired;
        }
    }
  }

  static ToDoImportance getToDoImportance(int index) {
    switch (index) {
      case 0:
        return ToDoImportance.normal;
      case 1:
        return ToDoImportance.urgent;
      default:
        {
          return ToDoImportance.veryUrgent;
        }
    }
  }

  static List<ToDoModel> castToDoSqlToDoModel(List<ToDoModelSql> allToDosSql) {
    List<ToDoModel> toDos = [];
    for (var element in allToDosSql) {
      toDos.add(
        ToDoModel(
            id: element.id!,
            expiredDate: element.expiredDate,
            description: element.description,
            title: element.title,
            createdAt: element.createdAt,
            category: getCategoryById(element.categoryId),
            status: getToDoStatus(element.status),
            toDoImportance: getToDoImportance(element.toDoImportance)),
      );
    }
    return toDos;
  }
}
