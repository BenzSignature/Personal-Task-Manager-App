import 'package:get/get.dart';
import 'package:personal_task_manager_app/src/controllers/task/task_controllers.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskController());
  }
}
