import 'package:get/get.dart';
import 'package:personal_task_manager_app/src/config/export_config.dart';
import 'package:personal_task_manager_app/src/controllers/export_controllers.dart';
import 'package:personal_task_manager_app/src/core/widgets/export_widgets.dart';
import 'package:personal_task_manager_app/src/models/export_model.dart';
import 'package:personal_task_manager_app/src/routes/export_routes.dart';

class HomeView extends GetView<TaskController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText('My Tasks', fontSize: 18),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () => Get.toNamed(PathRoutes.calendarTable),
          ),
        ],
      ),
      body: Obx(() {
        final tasks = controller.taskList.where((task) {
          final query = controller.searchQuery.value.toLowerCase();
          return task.title.toLowerCase().contains(query);
        }).toList();
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: '🔍 Search tasks...',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (value) => controller.searchQuery.value = value,
              ),
            ),
            if (tasks.isEmpty)
              const Expanded(child: Center(child: Text("No tasks found")))
            else
              Expanded(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final TaskModel task = tasks[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: ListTile(
                        onTap: () {
                          Get.toNamed(
                            PathRoutes.editController,
                            arguments: task,
                          );
                        },
                        title: CustomText(
                          task.title,
                          decoration: task.isDone
                              ? TextDecoration.lineThrough
                              : null,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              task.description,
                              fontWeight: FontWeight.w400,
                            ),
                            const SizedBox(height: 4),
                            CustomText(
                              'วันที่ : ${task.date.toLocal().toString().split(' ')[0]}',
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Checkbox(
                              value: task.isDone,
                              onChanged: (_) => controller.toggleDone(index),
                            ),
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                Get.toNamed(
                                  PathRoutes.editController,
                                  arguments: task,
                                );
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => controller.deleteTask(index),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(PathRoutes.addTask);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
