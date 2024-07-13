import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
 import 'package:todo_app/product/model/priorty_model.dart';
import 'package:todo_app/product/model/todo_model.dart';
import 'package:todo_app/product/services/api_service.dart';

import '../../product/route/app_route.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    debugPrint("home provider init");

    fetchTasksAndPriorties();
  }

  bool? isLoading;
  List<PriortyModel>? priortyList;
  List<TodoModel>? taskList;

  Future<void> fetchTasksAndPriorties() async {
    priortyList = (await ApiService.instance.getDio("priorty", PriortyModel()))
        ?.cast<PriortyModel>();

    taskList = (await ApiService.instance.getDio("task", TodoModel()))
        ?.cast<TodoModel>();

    if (priortyList != null && taskList != null) {
      isLoading = true;
    } else {
      isLoading = false;
    }

    notifyListeners();
  }

  Future<void> removeTask(String id) async {
    await ApiService.instance.removeDio(id);
  }

  void goPriortyOrTask(String value, BuildContext context) {
    if (value == "priorty") {
      context.pushNamed(AppRoutes.addTaskPriorty,
          pathParameters: {"view": "priorty"});
    } else {
      context.pushNamed(
        AppRoutes.addTaskPriorty,
        pathParameters: {"view": "task"},
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("home dispose");
  }
}
