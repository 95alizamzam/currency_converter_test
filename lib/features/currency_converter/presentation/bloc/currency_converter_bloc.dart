import 'package:bloc/bloc.dart';
import 'package:currency_converter/features/currency_converter/domain/usecases/convert_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/get_currency_symbols_usecase.dart';
import 'currency_converter_event.dart';
import 'currency_converter_state.dart';

@injectable
class CurrencyConverterBloc
    extends Bloc<CurrencyConverterEvent, CurrencyConverterState> {
  final GetSymbolsUseCase getSymbolsUseCase;
  final ConvertCurrencyUseCase convertCurrencyUseCase;

  late String fromCurrency = 'USD';
  late String toCurrency = 'IQD';

  CurrencyConverterBloc({
    required this.getSymbolsUseCase,
    required this.convertCurrencyUseCase,
  }) : super(CurrencyConverterInitial()) {
    on<GetSymbolsEvent>((event, emit) async {
      emit(GetSymbolsLoading());
      final response = await getSymbolsUseCase(unit);
      response.fold(
        (l) => emit(GetSymbolsFailed(failure: l)),
        (r) => emit(GetSymbolsDone(entity: r)),
      );
    });

    on<ChangeCurrencySymbolsEvent>((event, emit) {
      fromCurrency = event.from;
      toCurrency = event.to;
      emit(SymbolsChanged());
    });

    on<ConvertEvent>((event, emit) async {
      emit(ConvertLoading());
      final ConvertParams params = ConvertParams(
        amount: event.amount,
        from: fromCurrency,
        to: toCurrency,
      );
      final response = await convertCurrencyUseCase(params);
      response.fold(
        (l) => emit(ConvertFailed(failure: l)),
        (r) => emit(ConvertDone(entity: r)),
      );
    });
  }
}
