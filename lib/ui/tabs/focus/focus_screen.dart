import 'package:flutter/material.dart';

import '../../../data/local/db/local_database.dart';
import '../../../models/todo_model/todo_model.dart';
import '../home/widgets/todo_item_view.dart';

class FocusScreen extends StatefulWidget {
  const FocusScreen({
    Key? key,
    required this.toDos,
    required this.onSomethingChanged,
  }) : super(key: key);

  final List<ToDoModel> toDos;

  final VoidCallback onSomethingChanged;

  @override
  State<FocusScreen> createState() => _FocusScreenState();
}

class _FocusScreenState extends State<FocusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Trash list")),
      body: ListView(
        children: [
          ...List.generate(widget.toDos.length, (index) {
            ToDoModel toDoModel = widget.toDos[index];
            return Column(
              children: [
                ToDoItemView(
                  toDoModel: toDoModel,
                  onSelect: () {},
                  onCancelTap: () {},
                ),
                TextButton(
                    onPressed: () {
                      LocalDatabase.deleteToDo(toDoModel.id);
                      widget.onSomethingChanged.call();
                    },
                    child: Text("DELTE"))
              ],
            );
          }),
          const SizedBox(height: 100)
        ],
      ),
    );
  }
}
