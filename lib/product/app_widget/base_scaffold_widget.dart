import 'package:flutter/material.dart';

import 'appbar_widget.dart';
import 'floating_act_btn.dart';

class BaseScaffoldWidget extends StatelessWidget {
  const BaseScaffoldWidget(
      {super.key, this.child, this.onClickPriorty, this.onClickTask});

  final Function()? onClickPriorty;
  final Function()? onClickTask;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(),
        floatingActionButton: Row(
          children: [
            const SizedBox(width: 30),
            FloatingActBtn(
              
              title: "Add Priorty", onClick: onClickPriorty),
            const Expanded(child: SizedBox()),
            FloatingActBtn(title: "Add Task", onClick: onClickTask),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: child,
        ));
  }
}
