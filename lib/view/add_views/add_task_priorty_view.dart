import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/product/app_widget/base_scaffold_widget.dart';
import 'package:todo_app/product/app_widget/loading_circular_widget.dart';
import 'package:todo_app/product/model/priorty_model.dart';
import 'package:todo_app/view/add_views/add_task_priorty_provider.dart';

import '../../core/core_widgets/dropdown_widget.dart';
import '../../core/core_widgets/form_widget/text_form_field.dart';

class AddTaskPriortyView extends StatelessWidget {
  const AddTaskPriortyView({super.key, required this.view});

  final String view;

  @override
  Widget build(BuildContext context) {
    debugPrint(view);
    return ChangeNotifierProvider(
        create: (context) => AddTaskPriortyProvider(context, view),
        builder: (context, child) {
          final provider = context.read<AddTaskPriortyProvider>();
          return provider.isLoading == true
              ? BaseScaffoldWidget(
                  // onClick: () => provider.addTask(),
                  child: Form(
                      key: provider.formKey,
                      autovalidateMode: AutovalidateMode.always,
                      child: SingleChildScrollView(
                          child: view == "priorty"
                              ? priortyForms(provider)
                              : taskForms(provider))),
                )
              : const LoadingCircular();
        });
  }

  Widget taskForms(AddTaskPriortyProvider provider) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormFieldWidget(
            isNullValid: true, controller: provider.firstTextEditing),
        const SizedBox(height: 40),
        TextFormFieldWidget(
            isNullValid: true, controller: provider.secondTextEditing),
        const SizedBox(height: 40),
        DropdownMenuWidget<PriortyModel>(
          dataList: provider.homeProvider?.priortyList ?? [],
          labelBuilder: (p0) {
            return p0.priortyName ?? '';
          },
          onSelected: (p0) {
            provider.priortyId = p0?.priortyCode;
          },
        ),
        ElevatedButton(
            onPressed: () {
              provider.addTask();
            },
            child: const Text("Save"))
      ],
    );
  }

  Widget priortyForms(AddTaskPriortyProvider provider) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormFieldWidget(
            hint: "Priorty Code",
            isNullValid: false,
            controller: provider.firstTextEditing),
        const SizedBox(height: 40),
        TextFormFieldWidget(
            hint: "Priorty Name",
            isNullValid: true,
            controller: provider.secondTextEditing),
        const SizedBox(height: 40),
        TextFormFieldWidget(
            hint: "Priorty Icon Url",
            isNullValid: true,
            controller: provider.thirdTextEditing),
        ElevatedButton(
            onPressed: () {
              provider.addPriorty();
            },
            child: const Text("Save"))
      ],
    );
  }
}
