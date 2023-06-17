import 'package:currency_converter/core/network/exceptions.dart';
import 'package:currency_converter/core/widgets/error_widget.dart';
import 'package:currency_converter/features/currency_converter/presentation/bloc/currency_converter_bloc.dart';
import 'package:currency_converter/features/currency_converter/presentation/bloc/currency_converter_event.dart';
import 'package:currency_converter/features/currency_converter/presentation/bloc/currency_converter_state.dart';
import 'package:currency_converter/features/currency_converter/presentation/widgets/amount_text_field.dart';
import 'package:currency_converter/features/currency_converter/presentation/widgets/drop_down.dart';
import 'package:currency_converter/features/currency_converter/presentation/widgets/result_box.dart';
import 'package:currency_converter/injectable_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConvertScreen extends StatefulWidget {
  const ConvertScreen({super.key});

  @override
  State<ConvertScreen> createState() => _ConvertScreenState();
}

class _ConvertScreenState extends State<ConvertScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController con = TextEditingController();
  final currencyConverterBloc = getIt<CurrencyConverterBloc>();
  late List<List<String>> symbols;

  @override
  void initState() {
    super.initState();
    currencyConverterBloc.add(GetSymbolsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Currency Converter'),
      ),
      body: BlocConsumer<CurrencyConverterBloc, CurrencyConverterState>(
        bloc: currencyConverterBloc,
        listener: (context, state) {
          if (state is GetSymbolsDone) {
            symbols = state.entity.codes;
          }

          if (state is ConvertFailed) {
            useSnackBar(getErrorMessage(state.failure));
          }
        },
        builder: (context, state) {
          if (state is GetSymbolsLoading || state is CurrencyConverterInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is GetSymbolsFailed) {
            return Center(
                child: ErrorView(
              failure: state.failure,
              onTap: () {
                currencyConverterBloc.add(GetSymbolsEvent());
              },
            ));
          }

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('from'),
                  const SizedBox(height: 8),
                  CurrencyDropDownBtn(
                    value: currencyConverterBloc.fromCurrency,
                    onValueChange: (value) {
                      currencyConverterBloc.add(
                        ChangeCurrencySymbolsEvent(
                          from: value,
                          to: currencyConverterBloc.toCurrency,
                        ),
                      );
                    },
                    symbols: symbols,
                  ),
                  const SizedBox(height: 20),
                  const Text('to'),
                  const SizedBox(height: 8),
                  CurrencyDropDownBtn(
                    value: currencyConverterBloc.toCurrency,
                    onValueChange: (value) {
                      currencyConverterBloc.add(
                        ChangeCurrencySymbolsEvent(
                          from: currencyConverterBloc.fromCurrency,
                          to: value,
                        ),
                      );
                    },
                    symbols: symbols,
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: formKey,
                    child: AmountTextField(controller: con),
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<CurrencyConverterBloc, CurrencyConverterState>(
                    bloc: currencyConverterBloc,
                    builder: (context, state) {
                      if (state is ConvertLoading) {
                        return const Center(
                          child: CircularProgressIndicator(color: Colors.green),
                        );
                      }
                      return ElevatedButton(
                        onPressed: convert,
                        child: const Text('convert'),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<CurrencyConverterBloc, CurrencyConverterState>(
                    bloc: currencyConverterBloc,
                    builder: (context, state) {
                      return ResultBox(
                        data: state is! ConvertDone ? null : (state).entity,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void convert() {
    if (!formKey.currentState!.validate()) {
      return;
    } else {
      try {
        final int amount = int.tryParse(con.text) ?? 0;
        currencyConverterBloc.add(ConvertEvent(amount: amount));
      } catch (e) {
        useSnackBar('invalid format for amount');
      }
    }
  }

  String getErrorMessage(CurrencyException failure) {
    if (failure is NoInternetException) {
      return 'Please Check Your Internet Connection';
    } else if (failure is ServerException) {
      return (failure).message;
    } else {
      return '';
    }
  }

  void useSnackBar(String text) {
    final SnackBar snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
