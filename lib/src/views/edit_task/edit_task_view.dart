import 'package:get/get.dart';
import 'package:personal_task_manager_app/src/config/export_config.dart';
import 'package:personal_task_manager_app/src/controllers/export_controllers.dart';
import 'package:personal_task_manager_app/src/models/export_model.dart';

class EditTaskView extends GetView<EditTaskController> {
  late final TaskModel task;
  EditTaskView({super.key}) {
    task = Get.arguments as TaskModel;
  }

  @override
  Widget build(BuildContext context) {
    controller.fillFromTask(task);

    return Scaffold(
      appBar: AppBar(title: const Text('✏️ Edit Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller.descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Get.find<TaskController>().editTask(
                  task,
                  controller.titleController.text,
                  controller.descriptionController.text,
                );
                Get.back();
              },
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
