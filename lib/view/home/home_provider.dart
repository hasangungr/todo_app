import 'package:flutter/material.dart';
import 'package:todo_app/product/model/priorty_model.dart';
import 'package:todo_app/product/services/api_service.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    debugPrint("home provider init");
  }
  bool isLoading = false;
  List<PriortyModel>? todoList;

  Future<void> fetchTodos() async {
    todoList = (await ApiService.instance.getDio("priorty", PriortyModel()))
        ?.cast<PriortyModel>();

    debugPrint(todoList?.first.priortyName);
    debugPrint(todoList?.first.id.toString());
    debugPrint(todoList?.first.priortyIcon);
    debugPrint(todoList?.last.priortyName);
    debugPrint(todoList?.last.id.toString());
    debugPrint(todoList?.last.priortyIcon);

    isLoading = true;

    print("object");

    notifyListeners();
  }
}
