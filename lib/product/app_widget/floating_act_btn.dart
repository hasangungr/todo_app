import 'package:flutter/material.dart';
import 'package:todo_app/core/extensions/context_extension.dart';

class FloatingActBtn extends StatelessWidget {
  const FloatingActBtn({super.key, required this.onClick, required this.title});

  final Function()? onClick;
  final String title;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: title,
      onPressed: onClick,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: context.appTextTheme.bodyMedium?.copyWith(color: Colors.white),
      ),
    );
  }
}
