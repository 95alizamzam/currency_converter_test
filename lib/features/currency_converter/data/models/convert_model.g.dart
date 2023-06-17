// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'convert_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConvertModel _$ConvertModelFromJson(Map<String, dynamic> json) => ConvertModel(
      result: json['result'] as String,
      timeLastUpdateUtc: json['time_last_update_utc'] as String,
      timeNextUpdateUtc: json['time_next_update_utc'] as String,
      conversionRate: (json['conversion_rate'] as num).toDouble(),
      conversionResult: (json['conversion_result'] as num).toDouble(),
    );
