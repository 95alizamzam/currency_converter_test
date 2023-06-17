import 'package:bloc/bloc.dart';
import 'package:currency_converter/core/theme/app_theme.dart';
import 'package:currency_converter/features/currency_converter/presentation/pages/convert_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/bloc_observer/observer.dart';
import 'injectable_config.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  configureDependencies();
  Bloc.observer = MyBlocObserver();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getIt<AppTheme>().lightTheme,
      home: const Scaffold(body: ConvertScreen()),
    );
  }
}
