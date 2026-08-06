import 'package:get/get.dart';
import 'package:studycycle/features/personalization/setup_popup.dart';

class DashboardController extends GetxController {
  @override
  void onReady() {
    super.onReady();

    Get.dialog(
      const SSetupPopup(),
      barrierDismissible: false,
    );
  }

  final RxString username = "Emmanuel".obs;

  final RxString greeting = "Good Morning".obs;
}
