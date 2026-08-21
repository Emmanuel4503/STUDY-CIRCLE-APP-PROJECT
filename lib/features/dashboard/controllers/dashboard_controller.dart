import 'package:get/get.dart';
import 'package:studycycle/features/personalization/setup_popup.dart';
import 'package:studycycle/utils/services/storage_service.dart';

class DashboardController extends GetxController {
  @override
  void onReady() {
    super.onReady();

    if (StorageService.instance.hasCompletedProfileSetup) {
      return;
    }

    Get.dialog(
      const SSetupPopup(),
      barrierDismissible: false,
    );
  }

  final RxString username = "Emmanuel".obs;

  final RxString greeting = "Good Morning".obs;
}
