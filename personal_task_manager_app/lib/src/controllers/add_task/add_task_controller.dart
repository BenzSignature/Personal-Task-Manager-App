import 'package:get/get.dart';
import 'package:personal_task_manager_app/src/config/export_config.dart';
import 'package:personal_task_manager_app/src/controllers/task/export_task_controllers.dart';
import 'package:personal_task_manager_app/src/models/export_model.dart';

class AddTaskController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  var selectedDate = DateTime.now().obs;

  void pickDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      selectedDate.value = date;
    }
  }

  void saveTask() {
    final title = titleController.text.trim();
    final description = descriptionController.text.trim();

    if (title.isEmpty || description.isEmpty) {
      Get.snackbar('แจ้งเตือน', 'กรุณากรอกข้อมูลให้ครบ');
      return;
    }
    final task = TaskModel(
      title: title,
      description: description,
      date: selectedDate.value,
    );
    Get.find<TaskController>().addTask(task);
    Get.back();
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
