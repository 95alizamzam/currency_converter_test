import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/convert_entity.dart';

class ResultBox extends StatelessWidget {
  const ResultBox({super.key, this.data});

  final ConvertEntity? data;
  @override
  Widget build(BuildContext context) {
    return data == null
        ? const SizedBox.shrink()
        : Container(
            padding: const EdgeInsets.all(20),
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    height: 1.5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Conversion Rate = ${data!.conversionRate.toString()}'),
                      Text(
                          'Conversion Result = ${data!.conversionResult.toString()}'),
                      Text(
                          'Last Update At = ${reFormatDate(data!.timeLastUpdateUtc.toString())}'),
                      Text(
                          'Next Update At = ${reFormatDate(data!.timeNextUpdateUtc.toString())}'),
                    ],
                  ),
                ),
              ],
            ),
          );
  }

  String reFormatDate(String date) {
    final DateTime parsedDate = DateFormat('EEE, dd MMM yyyy').parse(date);
    return DateFormat('yyyy-MM-dd').format(parsedDate);
  }
}
