import 'package:flutter/material.dart';
import 'package:todo_app/ui/tabs/home/widgets/todo_item_view.dart';

import '../../../data/local/db/local_database.dart';
import '../../../models/todo_model/todo_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    required this.toDos,
    required this.onSomethingChanged,
  }) : super(key: key);

  final List<ToDoModel> toDos;
  final VoidCallback onSomethingChanged;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("To Do List")),
      body: ListView(
        children: [
          ...List.generate(widget.toDos.length, (index) {
            ToDoModel toDoModel = widget.toDos[index];
            return ToDoItemView(
              toDoModel: toDoModel,
              onSelect: () {
                LocalDatabase.updateToDoStatus(
                  id: toDoModel.id,
                  statusIndex: 0,
                );
               widget.onSomethingChanged.call();
              },
              onCancelTap: () {
                LocalDatabase.updateToDoStatus(
                  id: toDoModel.id,
                  statusIndex: 2,
                );
                widget.onSomethingChanged.call();
              },
            );
          }),
          const SizedBox(height: 100)
        ],
      ),
    );
  }
}
