import 'package:personal_task_manager_app/src/config/export_config.dart';
import 'package:personal_task_manager_app/src/core/utils/media_queery.dart';
import 'package:personal_task_manager_app/src/core/widgets/export_widgets.dart';

class MyButton extends StatelessWidget {
  final void Function() onPressed;
  final String name;

  const MyButton({super.key, required this.onPressed, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: SizedBox(
        height: ScreenUtil.screenHeight(context) / 20,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: onPressed,
          child: CustomText(name, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
