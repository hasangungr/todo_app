import 'package:go_router/go_router.dart';
import 'package:todo_app/core/extensions/string_extension.dart';
import 'package:todo_app/view/add_views/add_task_priorty_view.dart';
import 'package:todo_app/view/home/home_view.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      name: AppRoutes.addTaskPriorty,
      path: "${AppRoutes.addTaskPriorty.viewName}/:view",
      builder: (context, state) => AddTaskPriortyView(
        view: state.pathParameters["view"]!,
      ),
    ),
  ],
);

abstract class AppRoutes {
  AppRoutes._();
  static const String home = '/';
  static const String addTaskPriorty = 'addTaskPriorty';
}
