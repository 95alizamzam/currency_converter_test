import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AppTheme {
  ThemeData get lightTheme => ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: const MaterialStatePropertyAll(Colors.white),
            textStyle: const MaterialStatePropertyAll(
              TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            fixedSize:
                const MaterialStatePropertyAll(Size(double.maxFinite, 50)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
            backgroundColor: const MaterialStatePropertyAll(Colors.green),
          ),
        ),
      );
}
