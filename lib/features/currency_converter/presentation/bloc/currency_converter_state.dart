// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:currency_converter/core/network/exceptions.dart';

import '../../domain/entities/convert_entity.dart';
import '../../domain/entities/code_entity.dart';

abstract class CurrencyConverterState {}

class CurrencyConverterInitial extends CurrencyConverterState {}

class GetSymbolsLoading extends CurrencyConverterState {}

class GetSymbolsDone extends CurrencyConverterState {
  final CodeEntity entity;
  GetSymbolsDone({required this.entity});
}

class GetSymbolsFailed extends CurrencyConverterState {
  final CurrencyException failure;
  GetSymbolsFailed({required this.failure});
}

class SymbolsChanged extends CurrencyConverterState {}

class ConvertLoading extends CurrencyConverterState {}

class ConvertDone extends CurrencyConverterState {
  final ConvertEntity entity;
  ConvertDone({required this.entity});
}

class ConvertFailed extends CurrencyConverterState {
  final CurrencyException failure;
  ConvertFailed({required this.failure});
}
