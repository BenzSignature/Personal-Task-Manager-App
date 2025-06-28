import 'package:get/get.dart';
import 'package:personal_task_manager_app/src/config/export_config.dart';
import 'package:personal_task_manager_app/src/models/export_model.dart';

class EditTaskController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  void fillFromTask(TaskModel task) {
    titleController.text = task.title;
    descriptionController.text = task.description;
  }
}
