import 'package:currency_converter/core/network/exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<T, D> {
  Future<Either<CurrencyException, T>> call(D params);
}
