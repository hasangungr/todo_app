import 'package:flutter/material.dart';
import 'package:todo_app/product/app_widget/appbar_widget.dart';
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
        onClick: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: ToDoCardWidget(
                    title: index.toString(), subTitle: "subTitle $index"),
              );
            },
            itemCount: 2),
      ),
    );
  }
}
