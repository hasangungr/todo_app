import 'package:flutter/material.dart';

import '../home_provider.dart';
import 'todo_card_widget.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key, required this.provider});

  final HomeProvider provider;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: provider.taskList?.length ?? 0,
      itemBuilder: (context, index) {
        return ToDoCardWidget(
          todoModel: provider.taskList![index],
          iconUrl: provider.priortyList!
              .firstWhere((element) =>
                  element.priortyCode == provider.taskList![index].priortyId)
              .priortyIcon,
        );
      },
    );
  }
}
