// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:currency_converter/core/network/dio.dart' as _i5;
import 'package:currency_converter/core/network/internet_checker.dart' as _i6;
import 'package:currency_converter/core/theme/app_theme.dart' as _i3;
import 'package:currency_converter/features/currency_converter/data/datasources/remote.dart'
    as _i4;
import 'package:currency_converter/features/currency_converter/data/repositories/currency_repo_impl.dart'
    as _i8;
import 'package:currency_converter/features/currency_converter/domain/repositories/currency_base_repo.dart'
    as _i7;
import 'package:currency_converter/features/currency_converter/domain/usecases/convert_use_case.dart'
    as _i10;
import 'package:currency_converter/features/currency_converter/domain/usecases/get_currency_symbols_usecase.dart'
    as _i9;
import 'package:currency_converter/features/currency_converter/presentation/bloc/currency_converter_bloc.dart'
    as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.AppTheme>(() => _i3.AppTheme());
    gh.lazySingleton<_i4.CurrencyRemoteDataSource>(
        () => _i4.CurrencyRemoteDataSourceImpl());
    gh.lazySingleton<_i5.DioClass>(() => _i5.DioClass());
    gh.lazySingleton<_i6.InternetCheckerClass>(
        () => _i6.InternetCheckerClass());
    gh.lazySingleton<_i7.CurrencyBaseRepository>(() =>
        _i8.CurrencyRepositoryImpl(remote: gh<_i4.CurrencyRemoteDataSource>()));
    gh.lazySingleton<_i9.GetSymbolsUseCase>(
        () => _i9.GetSymbolsUseCase(repo: gh<_i7.CurrencyBaseRepository>()));
    gh.lazySingleton<_i10.ConvertCurrencyUseCase>(() =>
        _i10.ConvertCurrencyUseCase(repo: gh<_i7.CurrencyBaseRepository>()));
    gh.factory<_i11.CurrencyConverterBloc>(() => _i11.CurrencyConverterBloc(
          getSymbolsUseCase: gh<_i9.GetSymbolsUseCase>(),
          convertCurrencyUseCase: gh<_i10.ConvertCurrencyUseCase>(),
        ));
    return this;
  }
}
