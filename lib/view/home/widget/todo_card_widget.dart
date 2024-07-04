import 'package:flutter/material.dart';

class ToDoCardWidget extends StatelessWidget {
  const ToDoCardWidget(
      {super.key, required this.title, required this.subTitle});

  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        trailing: const Icon(Icons.warning_amber_outlined),
      ),
    );
  }
}
