import 'package:get/get.dart';
import 'package:personal_task_manager_app/src/bindings/export_bindings.dart';
import 'package:personal_task_manager_app/src/config/export_config.dart';
import 'package:personal_task_manager_app/src/models/task/export_task_model.dart';
import 'package:personal_task_manager_app/src/routes/export_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>('tasks');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Task Manager',
      initialBinding: HomeBinding(),
      initialRoute: PathRoutes.home,
      getPages: PagesRoutes.routes,
    );
  }
}
