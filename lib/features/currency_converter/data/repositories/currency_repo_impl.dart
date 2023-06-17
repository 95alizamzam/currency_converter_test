// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:currency_converter/features/currency_converter/data/models/convert_model.dart';
import 'package:currency_converter/features/currency_converter/data/models/codes_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:currency_converter/core/network/exceptions.dart';
import 'package:currency_converter/features/currency_converter/domain/entities/code_entity.dart';
import 'package:currency_converter/features/currency_converter/domain/repositories/currency_base_repo.dart';

import '../../../../core/network/helper.dart';
import '../../domain/entities/convert_entity.dart';
import '../datasources/remote.dart';

@LazySingleton(as: CurrencyBaseRepository)
class CurrencyRepositoryImpl extends BaseRepositoryImpl
    implements CurrencyBaseRepository {
  final CurrencyRemoteDataSource remote;
  CurrencyRepositoryImpl({required this.remote});
  @override
  Future<Either<CurrencyException, CodeEntity>> getSymbols() async {
    try {
      final result = await request<CodeEntity>(
        body: () async {
          final response = await remote.getSymbols();
          return response.toDomain();
        },
      );

      return right(result);
    } on CurrencyException catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<CurrencyException, ConvertEntity>> convert(
      {required String from, required String to, required int amount}) async {
    try {
      final result = await request<ConvertEntity>(
        body: () async {
          final response =
              await remote.currencyConvert(from: from, to: to, amount: amount);
          return response.toDomain();
        },
      );

      return right(result);
    } on CurrencyException catch (e) {
      return left(e);
    }
  }
}
