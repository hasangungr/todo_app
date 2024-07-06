import 'package:flutter/material.dart';
import 'package:todo_app/product/model/priorty_model.dart';
import 'package:todo_app/product/model/todo_model.dart';
import 'package:todo_app/product/services/api_service.dart';

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
      //
      isLoading = true;
    } else {
      isLoading = false;
    }

    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("home dispose");
  }
}
