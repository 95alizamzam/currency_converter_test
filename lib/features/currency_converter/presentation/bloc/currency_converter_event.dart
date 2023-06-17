// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class CurrencyConverterEvent {}

class GetSymbolsEvent extends CurrencyConverterEvent {}

class ChangeCurrencySymbolsEvent extends CurrencyConverterEvent {
  final String from;
  final String to;
  ChangeCurrencySymbolsEvent({required this.from, required this.to});
}

class ConvertEvent extends CurrencyConverterEvent {
  final int amount;
  ConvertEvent({required this.amount});
}
