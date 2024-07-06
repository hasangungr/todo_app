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

    if (view == "priorty") {
      firstTextEditing = TextEditingController();
      secondTextEditing = TextEditingController();
      thirdTextEditing = TextEditingController();
    } else {
      firstTextEditing = TextEditingController();
      secondTextEditing = TextEditingController();
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
      bool isAdded = await ApiService.instance.postDio(
        "task",
        TodoModel(
            description: firstTextEditing.text,
            title: secondTextEditing.text,
            priortyId: priortyId),
      );
      if (ctx.mounted) {
        if (isAdded == true) {
          ctx.goNamed(AppRoutes.home);
        } else {
          showAboutDialog(context: ctx);
        }
      }
    } else {
      showAboutDialog(context: ctx);
    }
  }

  Future<void> addPriorty() async {
    if (formKey?.currentState?.validate() ?? false) {
      bool isAdded = await ApiService.instance.postDio(
        "priorty",
        PriortyModel(
          priortyCode: int.tryParse(firstTextEditing.text),
          priortyName: secondTextEditing.text,
          priortyIcon: thirdTextEditing.text,
        ),
      );
      if (ctx.mounted) {
        if (isAdded == true) {
          ctx.goNamed(AppRoutes.home);
        } else {
          showAboutDialog(context: ctx);
        }
      }
    } else {
      showAboutDialog(context: ctx);
    }
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("add dispose");
  }
}
