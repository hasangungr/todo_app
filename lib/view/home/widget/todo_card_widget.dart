import 'package:flutter/material.dart';
import 'package:todo_app/product/model/todo_model.dart';

class ToDoCardWidget extends StatelessWidget {
  const ToDoCardWidget(
      {super.key, required this.todoModel, required this.iconUrl});

  final TodoModel todoModel;
  final String? iconUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        title: Text(todoModel.title ?? ''),
        subtitle: Text(todoModel.description ?? ''),
        trailing: iconUrl != null ? Image.network(iconUrl!) : null,
      ),
    );
  }
}
