import 'package:currency_converter/core/network/exceptions.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    super.key,
    required this.failure,
    required this.onTap,
  });

  final CurrencyException failure;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            getErrorMessage(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: onTap,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  String getErrorMessage() {
    if (failure is NoInternetException) {
      return 'Please Check Your Internet Connection';
    }
    if (failure is ServerException) {
      return (failure as ServerException).message;
    }

    return '';
  }
}
