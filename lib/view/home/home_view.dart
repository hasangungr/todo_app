import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/product/app_widget/base_scaffold_widget.dart';
import 'package:todo_app/product/constants/string_constants.dart';
import 'package:todo_app/view/home/home_provider.dart';

import '../../product/app_widget/loading_circular_widget.dart';
import 'widget/task_list_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.watch<HomeProvider>().isLoading != null) {
      return BaseScaffoldWidget(
       onClickPriorty: () async =>
            context.read<HomeProvider>().goPriortyOrTask("priorty", context),
        onClickTask: () async =>
            context.read<HomeProvider>().goPriortyOrTask("task", context), 
        child: context.read<HomeProvider>().isLoading == true
            ? const TaskList()
            : const Center(
                child: Text(
                  StringConstants.requestError,
                  style: TextStyle(color: Colors.black),
                ),
              ),
      );
    } else {
      return const LoadingCircular();
    }
  }
}
