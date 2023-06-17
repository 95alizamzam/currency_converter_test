// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class CurrencyException {}

class NoInternetException extends CurrencyException {}

class ServerException extends CurrencyException {
  final String message;
  ServerException({required this.message});
}
