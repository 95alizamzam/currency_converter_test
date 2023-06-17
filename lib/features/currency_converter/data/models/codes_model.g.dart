// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'codes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodesModel _$CodesModelFromJson(Map<String, dynamic> json) => CodesModel(
      result: json['result'] as String,
      supportedCodes: (json['supported_codes'] as List<dynamic>?)
              ?.map(
                  (e) => (e as List<dynamic>).map((e) => e as String).toList())
              .toList() ??
          [],
    );
