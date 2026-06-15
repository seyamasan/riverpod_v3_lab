class SomeSpecificError implements Exception {
  final String message;

  SomeSpecificError(this.message);

  @override
  String toString() => 'SomeSpecificError: $message';
}