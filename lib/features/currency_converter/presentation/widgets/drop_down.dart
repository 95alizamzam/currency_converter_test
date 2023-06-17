import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

typedef OnValueChange = Function(String value);

class CurrencyDropDownBtn extends StatelessWidget {
  const CurrencyDropDownBtn({
    super.key,
    required this.onValueChange,
    required this.value,
    required this.symbols,
  });

  final String value;
  final OnValueChange onValueChange;
  final List<List<String>> symbols;

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      dropdownBuilder: (c, selectedItem) {
        return Text(
          selectedItem ?? value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        );
      },
      items: symbols.map((e) => e.first).toList(),
      popupProps: PopupProps.menu(
        showSelectedItems: true,
        showSearchBox: true,
        searchDelay: const Duration(milliseconds: 500),
        emptyBuilder: (context, searchEntry) {
          return Center(
            child: Text(
              'No Result matched $searchEntry',
              style: const TextStyle(color: Colors.red, fontSize: 15),
            ),
          );
        },
        loadingBuilder: (context, searchEntry) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(
                color: Colors.green,
              ),
              Text('Searching For $searchEntry'),
            ],
          );
        },
        searchFieldProps: TextFieldProps(
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            hintText: 'Search For Currency',
            hintStyle: const TextStyle(
              color: Colors.black,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Colors.green,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Colors.green,
              ),
            ),
          ),
        ),
      ),
      onChanged: (String? data) {
        onValueChange(data!);
      },
    );
  }
}
