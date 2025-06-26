import 'package:get/get.dart';
import 'package:personal_task_manager_app/src/config/export_config.dart';
import 'package:personal_task_manager_app/src/controllers/export_controllers.dart';

class AddTaskView extends GetView<AddTaskController> {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('เพิ่มงานใหม่')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.titleController,
              decoration: const InputDecoration(
                labelText: 'ชื่องาน',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controller.descriptionController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'รายละเอียด',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            Obx(
              () => Row(
                children: [
                  const Text('วันที่:'),
                  const SizedBox(width: 12),
                  Text(
                    '${controller.selectedDate.value.toLocal()}'.split(' ')[0],
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () => controller.pickDate(context),
                    child: const Text('เลือกวันที่'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: controller.saveTask,
              child: const Text('บันทึก'),
            ),
          ],
        ),
      ),
    );
  }
}
