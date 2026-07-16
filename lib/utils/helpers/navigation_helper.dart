import 'package:get/get.dart';

/// Thin, testable wrapper around GetX navigation.
///
/// Using this helper (instead of calling `Get.toNamed` directly in widgets)
/// keeps navigation intent readable and gives you one place to add logging,
/// analytics, or guards later.
abstract class NavigationHelper {
  NavigationHelper._();

  /// Push a named route onto the stack.
  static Future<T?>? to<T>(String route, {dynamic arguments}) =>
      Get.toNamed<T>(route, arguments: arguments);

  /// Replace the current route.
  static Future<T?>? off<T>(String route, {dynamic arguments}) =>
      Get.offNamed<T>(route, arguments: arguments);

  /// Clear the stack and go to [route] (e.g. after login/logout).
  static Future<T?>? offAll<T>(String route, {dynamic arguments}) =>
      Get.offAllNamed<T>(route, arguments: arguments);

  /// Pop the current route.
  static void back<T>({T? result}) => Get.back<T>(result: result);
}
