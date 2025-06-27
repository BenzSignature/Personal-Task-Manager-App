import 'package:personal_task_manager_app/src/config/export_config.dart';

class CustomSmoothIndicator extends StatelessWidget {
  final int activeIndex;
  final int countImage;
  const CustomSmoothIndicator({
    super.key,
    required this.activeIndex,
    required this.countImage,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: countImage,
      effect: const WormEffect(
        dotHeight: 12,
        dotWidth: 12,
        activeDotColor: Colors.red,
      ),
    );
  }
}
