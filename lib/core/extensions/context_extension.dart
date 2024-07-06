import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get appHeight => MediaQuery.of(this).size.height;
  double get appWidth => MediaQuery.of(this).size.width;

  TextTheme get appTextTheme => Theme.of(this).textTheme;
}
