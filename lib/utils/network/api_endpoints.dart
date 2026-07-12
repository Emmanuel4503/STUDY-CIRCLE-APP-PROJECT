/// Central list of API endpoints.
///
/// Keep the base URL and every path here so switching environments
/// (dev/staging/prod) is a one-place change.
abstract class ApiEndpoints {
  ApiEndpoints._();

  static const String baseUrl = 'https://api.studycycle.example.com';

  // Auth (placeholders)
  static const String login = '/auth/login';
  static const String register = '/auth/register';

  // Academic (placeholders)
  static const String courses = '/academic/courses';
}
