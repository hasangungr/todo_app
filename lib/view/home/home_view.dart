import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/product/app_widget/appbar_widget.dart';
import 'package:todo_app/view/home/home_provider.dart';
import 'package:todo_app/view/home/widget/todo_card_widget.dart';

import '../../product/app_widget/floating_act_btn.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: const CustomAppbar(),
      floatingActionButton: FloatingActBtn(
        onClick: () async {
          await context.read<HomeProvider>().fetchTodos();
        },
      ),
      body: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListView.builder(
            itemCount: context.watch<HomeProvider>().todoList?.length ?? 0,
            itemBuilder: (context, index) {
              final val = context.watch<HomeProvider>().todoList?[index];
              return ToDoCardWidget(
                  title: val?.id.toString() ?? "",
                  subTitle: val?.priortyName ?? '123');
            },
          )),
    );
  }
}
