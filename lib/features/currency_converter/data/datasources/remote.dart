import 'package:currency_converter/core/network/dio.dart';
import 'package:currency_converter/injectable_config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

import '../models/convert_model.dart';
import '../models/codes_model.dart';

abstract class CurrencyRemoteDataSource {
  Future<CodesModel> getSymbols();
  Future<ConvertModel> currencyConvert(
      {required String from, required String to, required int amount});
}

@LazySingleton(as: CurrencyRemoteDataSource)
class CurrencyRemoteDataSourceImpl extends CurrencyRemoteDataSource {
  @override
  Future<CodesModel> getSymbols() async {
    final String? key = dotenv.env['APP_ID'];
    final response = await getIt<DioClass>().dio.get('$key/codes');

    final CodesModel model = CodesModel.fromJson(response.data);

    return model;
  }

  @override
  Future<ConvertModel> currencyConvert({
    required String from,
    required String to,
    required int amount,
  }) async {
    final String? key = dotenv.env['APP_ID'];
    final response =
        await getIt<DioClass>().dio.get('$key/pair/$from/$to/$amount');

    return ConvertModel.fromJson(response.data);
  }
}
