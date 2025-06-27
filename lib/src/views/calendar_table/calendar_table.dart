import 'package:get/get.dart';
import 'package:personal_task_manager_app/src/config/export_config.dart';
import 'package:personal_task_manager_app/src/controllers/export_controllers.dart';
import 'package:personal_task_manager_app/src/core/widgets/export_widgets.dart';

class CalendarTable extends GetView<TaskController> {
  const CalendarTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText('CalenDar Table', fontSize: 18),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Obx(() {
            return TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2100, 12, 31),
              focusedDay: controller.selectedDate.value,
              selectedDayPredicate: (day) =>
                  isSameDay(day, controller.selectedDate.value),
              onDaySelected: (selectedDay, focusedDay) {
                controller.selectedDate.value = selectedDay;
              },
              calendarFormat: CalendarFormat.month,
              onFormatChanged: (_) {},
              headerStyle: const HeaderStyle(formatButtonVisible: false),
              calendarStyle: const CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
              ),
            );
          }),
          const SizedBox(height: 16),
          const Divider(),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: CustomText(
              'Tasks for selected date',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Obx(() {
            final tasks = controller.taskList
                .where(
                  (task) => isSameDay(task.date, controller.selectedDate.value),
                )
                .toList();
            if (tasks.isEmpty) {
              return const CustomText("No tasks for this day", fontSize: 14);
            }
            return Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (_, index) {
                  final task = tasks[index];
                  return ListTile(
                    leading: Icon(
                      task.isDone
                          ? Icons.check_circle
                          : Icons.radio_button_unchecked,
                    ),
                    title: CustomText(task.title, fontSize: 14),
                    subtitle: CustomText(task.description, fontSize: 14),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
