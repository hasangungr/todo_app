import 'package:flutter/material.dart';
import 'package:todo_app/product/constants/string_constants.dart';

class CustomAppbar extends StatelessWidget implements PreferredSize {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return child;
  }

  @override
  Widget get child => AppBar(
        backgroundColor: Colors.grey,
        title: const Text(StringConstants.appbarTitle),
      );

  @override
  Size get preferredSize => const Size(0, 56);
}
