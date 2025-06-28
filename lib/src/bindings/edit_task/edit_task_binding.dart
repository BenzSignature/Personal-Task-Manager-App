import 'package:get/get.dart';
import 'package:personal_task_manager_app/src/controllers/export_controllers.dart';

class EditTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditTaskController());
  }
}
