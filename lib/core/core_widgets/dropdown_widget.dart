import 'package:flutter/material.dart';

class DropdownMenuWidget<T> extends StatelessWidget {
  const DropdownMenuWidget({
    super.key,
    required this.onSelected,
    required this.dataList,
    required this.labelBuilder,
  });

  final void Function(T?) onSelected;
  final List<T> dataList;
  final String Function(T) labelBuilder;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<T>(
        expandedInsets: const EdgeInsets.all(0),
        menuStyle: const MenuStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.white)),
        onSelected: onSelected,
        hintText: "Please Choose Priorty",
        dropdownMenuEntries: dataList
            .map((e) => DropdownMenuEntry<T>(value: e, label: labelBuilder(e)))
            .toList());
  }
}
