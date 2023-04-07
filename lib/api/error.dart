
class RequestError implements Exception {
  final int code;
  final String message;
  RequestError({
    required this.code,
    required this.message,
  });
  @override
  String toString() => 'RequestError: $code - $message';
}