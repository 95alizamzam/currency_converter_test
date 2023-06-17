// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:currency_converter/core/network/exceptions.dart';
import 'package:currency_converter/core/network/usecase.dart';

import '../entities/code_entity.dart';
import '../repositories/currency_base_repo.dart';

@lazySingleton
class GetSymbolsUseCase extends UseCase<CodeEntity, Unit> {
  final CurrencyBaseRepository repo;
  GetSymbolsUseCase({required this.repo});
  @override
  Future<Either<CurrencyException, CodeEntity>> call(params) async {
    return await repo.getSymbols();
  }
}
