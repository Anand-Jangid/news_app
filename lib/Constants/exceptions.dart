// ignore_for_file: public_member_api_docs, sort_constructors_first
class NetworkException implements Exception {
  final String message;

  NetworkException(this.message); 

  @override
  String toString() => 'NetworkException(message: $message)';
}
