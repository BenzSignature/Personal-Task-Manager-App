import 'package:personal_task_manager_app/src/config/export_config.dart';
import 'package:personal_task_manager_app/src/models/export_model.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  var taskList = <TaskModel>[].obs;
  late Box<TaskModel> taskBox;

  @override
  void onInit() {
    taskBox = Hive.box<TaskModel>('tasks');
    taskList.value = taskBox.values.toList();
    super.onInit();
  }

  void addTask(TaskModel task) {
    taskBox.add(task);
    taskList.add(task);
  }

  void updateTask(int index, TaskModel task) {
    taskBox.putAt(index, task);
    taskList[index] = task;
  }

  void deleteTask(int index) {
    taskBox.deleteAt(index);
    taskList.removeAt(index);
  }

  void toggleDone(int index) {
    var task = taskList[index];
    task.isDone = !task.isDone;
    task.save();
    taskList[index] = task;
  }
}
