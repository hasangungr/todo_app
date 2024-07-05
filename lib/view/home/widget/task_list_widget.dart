import 'package:flutter/material.dart';

import '../home_provider.dart';
import 'todo_card_widget.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key, required this.provider});

  final HomeProvider provider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: provider.taskList?.length ?? 0,
        itemBuilder: (context, index) {
          return ToDoCardWidget(
            todoModel: provider.taskList![index],
            iconUrl: provider.priortyList
                ?.firstWhere((element) =>
                    element.id == provider.taskList![index].priortyId)
                .priortyIcon,
          );
        },
      ),
    );
  }
}
