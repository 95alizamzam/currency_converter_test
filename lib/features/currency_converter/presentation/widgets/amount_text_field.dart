import 'package:flutter/material.dart';

class AmountTextField extends StatelessWidget {
  const AmountTextField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        enabled: true,
        hintText: 'Amount',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Required Field To Convert';
        }
        return null;
      },
    );
  }
}
