import 'package:json_annotation/json_annotation.dart';

import 'package:currency_converter/features/currency_converter/domain/entities/convert_entity.dart';

part 'convert_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class ConvertModel {
  final String result;
  final String timeLastUpdateUtc;
  final String timeNextUpdateUtc;
  final double conversionRate;
  final double conversionResult;
  ConvertModel({
    required this.result,
    required this.timeLastUpdateUtc,
    required this.timeNextUpdateUtc,
    required this.conversionRate,
    required this.conversionResult,
  });

  factory ConvertModel.fromJson(Map<String, dynamic> json) =>
      _$ConvertModelFromJson(json);
}

extension ConvertModelExt on ConvertModel {
  ConvertEntity toDomain() {
    return ConvertEntity(
      timeLastUpdateUtc: timeLastUpdateUtc,
      timeNextUpdateUtc: timeNextUpdateUtc,
      conversionRate: conversionRate,
      conversionResult: conversionResult,
    );
  }
}
