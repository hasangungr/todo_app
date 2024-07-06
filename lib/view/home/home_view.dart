import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/product/app_widget/base_scaffold_widget.dart';
import 'package:todo_app/product/constants/string_constants.dart';
import 'package:todo_app/product/route/app_route.dart';
import 'package:todo_app/view/home/home_provider.dart';

import '../../product/app_widget/loading_circular_widget.dart';
import 'widget/task_list_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    if (provider.isLoading != null) {
      return BaseScaffoldWidget(
        onClickPriorty: () async => context.pushNamed(AppRoutes.addTaskPriorty,
            pathParameters: {"view": "priorty"}),
        onClickTask: () async => context.pushNamed(AppRoutes.addTaskPriorty,
            pathParameters: {"view": "task"}),
        child: provider.isLoading == true
            ? TaskList(provider: provider)
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
