import 'package:get_storage/get_storage.dart';

/// Thin wrapper around [GetStorage] for persistent local key-value data.
///
/// Centralizing keys and access here avoids magic strings scattered across the
/// app and makes it easy to swap the storage engine later.
class StorageService {
  StorageService._();
  static final StorageService instance = StorageService._();

  final GetStorage _box = GetStorage();

  // ---- Keys ----
  static const String _kOnboardingSeen = 'onboarding_seen';
  static const String _kAuthToken = 'auth_token';
  static const String _kProfileSetupCompleted = 'profile_setup_completed';

  // ---- Onboarding ----
  bool get hasSeenOnboarding => _box.read(_kOnboardingSeen) ?? false;
  Future<void> setOnboardingSeen(bool value) => _box.write(_kOnboardingSeen, value);

  // ---- Auth token ----
  String? get authToken => _box.read(_kAuthToken);
  Future<void> setAuthToken(String? token) => _box.write(_kAuthToken, token);

  // ---- Profile setup ----
  bool get hasCompletedProfileSetup => _box.read(_kProfileSetupCompleted) ?? false;
  Future<void> setProfileSetupCompleted(bool value) => _box.write(_kProfileSetupCompleted, value);

  /// Clears everything (e.g. on logout).
  Future<void> clear() => _box.erase();
}
