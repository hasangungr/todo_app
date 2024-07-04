import 'package:flutter/material.dart';

class FloatingActBtn extends StatelessWidget {
  const FloatingActBtn({super.key, required this.onClick});

  final Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onClick,
      child: const Icon(Icons.add),
    );
  }
}
