import 'dart:developer';

import 'package:currency_converter/core/network/exceptions.dart';
import 'package:currency_converter/injectable_config.dart';
import 'package:dio/dio.dart';

import 'internet_checker.dart';

abstract class BaseRepository {
  Future<T> request<T>({required Future<T> Function() body});
}

class BaseRepositoryImpl extends BaseRepository {
  @override
  Future<T> request<T>({required Future<T> Function() body}) async {
    if (!await getIt<InternetCheckerClass>().checker.hasConnection) {
      throw NoInternetException();
    } else {
      try {
        return await body();
      } catch (e) {
        if (e is DioException) {
          log(e.response.toString());
          if (e.response != null && e.response!.statusCode != null) {
            switch (e.response!.statusCode) {
              case 404:
                throw ServerException(
                  message: 'The requested resource does not exist',
                );
              case 101:
                throw ServerException(
                  message:
                      'No API Key was specified or an invalid API Key was specified.',
                );
              case 103:
                throw ServerException(
                  message: 'The requested API endpoint does not exist.',
                );
              case 105:
                throw ServerException(
                  message:
                      'The current subscription plan does not support this API endpoint',
                );
              case 201:
                throw ServerException(
                  message: 'An invalid base currency has been entered',
                );
              case 403:
                throw ServerException(
                  message: 'No or an invalid amount has been specified',
                );

              default:
                throw ServerException(
                    message: 'Please try Again, Server Error');
            }
          }
        }

        log(e.toString());
        throw ServerException(message: 'Please try Again, Server Error');
      }
    }
  }
}
