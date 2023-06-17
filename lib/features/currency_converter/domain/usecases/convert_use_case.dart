// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:currency_converter/core/network/exceptions.dart';
import 'package:currency_converter/core/network/usecase.dart';

import '../entities/convert_entity.dart';
import '../repositories/currency_base_repo.dart';

@lazySingleton
class ConvertCurrencyUseCase extends UseCase<ConvertEntity, ConvertParams> {
  final CurrencyBaseRepository repo;
  ConvertCurrencyUseCase({required this.repo});
  @override
  Future<Either<CurrencyException, ConvertEntity>> call(params) async {
    return await repo.convert(
      amount: params.amount,
      from: params.from,
      to: params.to,
    );
  }
}

class ConvertParams {
  final int amount;
  final String from, to;

  ConvertParams({required this.amount, required this.from, required this.to});
}
