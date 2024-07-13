import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home_provider.dart';
import 'todo_card_widget.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: context.watch<HomeProvider>().taskList?.length ?? 0,
      itemBuilder: (context, index) {
        return ToDoCardWidget(
          todoModel: context.watch<HomeProvider>().taskList![index],
          iconUrl: context
              .watch<HomeProvider>()
              .priortyList!
              .firstWhere((element) =>
                  element.priortyCode ==
                  context.watch<HomeProvider>().taskList![index].priortyId)
              .priortyIcon,
        );
      },
    );
  }
}
