import 'package:dartz/dartz.dart';

import '../../../../core/network/exceptions.dart';
import '../entities/convert_entity.dart';
import '../entities/code_entity.dart';

abstract class CurrencyBaseRepository {
  Future<Either<CurrencyException, CodeEntity>> getSymbols();
  Future<Either<CurrencyException, ConvertEntity>> convert({
    required String from,
    required String to,
    required int amount,
  });
}
