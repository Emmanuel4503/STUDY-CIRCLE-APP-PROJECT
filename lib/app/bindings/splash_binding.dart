import 'package:get/get.dart';
import 'package:studycycle/features/authentication/screens/splash/controllers/splash_controller.dart';



class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
