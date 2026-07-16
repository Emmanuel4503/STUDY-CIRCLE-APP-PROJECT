/// A typed representation of something that went wrong.
///
/// Use [Failure] in controllers/services to model expected error states
/// (network down, unauthorized, etc.) instead of throwing raw exceptions
/// everywhere. Screens can then react to a `Failure` and show the right UI.
class Failure {
  final String message;
  final int? code;

  const Failure(this.message, {this.code});

  /// A generic fallback failure.
  factory Failure.unexpected() =>
      const Failure('Something went wrong. Please try again.');

  /// No/failed internet connection.
  factory Failure.network() =>
      const Failure('No internet connection. Check your network and retry.');

  /// Auth/permission related.
  factory Failure.unauthorized() =>
      const Failure('Your session has expired. Please log in again.', code: 401);

  @override
  String toString() => 'Failure(code: $code, message: $message)';
}
