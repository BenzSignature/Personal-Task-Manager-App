import 'package:get/get.dart';
import 'package:personal_task_manager_app/src/bindings/edit_task/edit_task_binding.dart';
import 'package:personal_task_manager_app/src/bindings/export_bindings.dart';
import 'package:personal_task_manager_app/src/routes/export_routes.dart';
import 'package:personal_task_manager_app/src/views/export_views.dart';

class PagesRoutes {
  static final routes = [
    // GetPage(name: PathRoutes.splash, page: () => const SplashScreen()),
    GetPage(
      name: PathRoutes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: PathRoutes.addTask,
      page: () => AddTaskView(),
      binding: AddTaskBinding(),
    ),
    GetPage(
      name: PathRoutes.calendarTable,
      page: () => CalendarTable(),
      binding: CalendarBinding(),
    ),
    GetPage(
      name: PathRoutes.editController,
      page: () => EditTaskView(),
      binding: EditTaskBinding(),
    ),
  ];
}
