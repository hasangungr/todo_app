import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/product/app_widget/appbar_widget.dart';
import 'package:todo_app/view/home/home_provider.dart';

import '../../product/app_widget/floating_act_btn.dart';
import 'widget/task_list_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    return provider.isLoading == true
        ? Scaffold(
            appBar: const CustomAppbar(),
            floatingActionButton: FloatingActBtn(
              onClick: () async =>
                  await context.read<HomeProvider>().fetchTasksAndPriorties(),
            ),
            body: TaskList(provider: provider),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
