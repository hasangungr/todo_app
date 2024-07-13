import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/product/model/priorty_model.dart';
import 'package:todo_app/product/model/todo_model.dart';
import 'package:todo_app/product/route/app_route.dart';
import 'package:todo_app/product/services/api_service.dart';
import 'package:todo_app/view/home/home_provider.dart';

class AddTaskPriortyProvider extends ChangeNotifier {
  AddTaskPriortyProvider(this.ctx, String view) {
    debugPrint("addtask provider init");
    formKey = GlobalKey();
    getView = view;
    firstTextEditing = TextEditingController();
    secondTextEditing = TextEditingController();
    if (view == "priorty") {
      thirdTextEditing = TextEditingController();
    }

    homeProvider = ctx.read<HomeProvider>();

    isLoading = true;
  }

  BuildContext ctx;

  GlobalKey<FormState>? formKey;

  late TextEditingController firstTextEditing;
  late TextEditingController secondTextEditing;
  late TextEditingController thirdTextEditing;

  HomeProvider? homeProvider;

  bool? isLoading = false;

  int? priortyId;

  late final String getView;

  Future<void> addTask() async {
    if (formKey?.currentState?.validate() ?? false) {
      final item = TodoModel(
          description: firstTextEditing.text,
          title: secondTextEditing.text,
          priortyId: priortyId);
      bool isAdded = await ApiService.instance.postDio("task", item);

      if (ctx.mounted) {
        if (isAdded == true) {
          // homeProvider?.taskList?.add(item);
          homeProvider?.fetchTasksAndPriorties();

          ctx.goNamed(AppRoutes.home);
        } else {
          showAboutDialog(context: ctx);
        }
      }
    } else {
      showAboutDialog(context: ctx);
    }
    notifyListeners();
  }

  Future<void> addPriorty() async {
    if (formKey?.currentState?.validate() ?? false) {
      final item = PriortyModel(
        
        priortyCode: int.tryParse(firstTextEditing.text),
        priortyName: secondTextEditing.text,
        priortyIcon: thirdTextEditing.text,
      );
      bool isAdded = await ApiService.instance.postDio("priorty", item);
      if (ctx.mounted) {
        if (isAdded == true) {
          homeProvider?.priortyList?.add(item);
          ctx.goNamed(AppRoutes.home);
        } else {
          showAboutDialog(context: ctx);
        }
      }
    } else {
      showAboutDialog(context: ctx);
    }
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("add dispose");
    firstTextEditing.dispose();
    secondTextEditing.dispose();
    if (getView == "priorty") {
      thirdTextEditing.dispose();
    }
  }
}
