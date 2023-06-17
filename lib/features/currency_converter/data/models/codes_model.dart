import 'package:currency_converter/features/currency_converter/domain/entities/code_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'codes_model.g.dart';

@JsonSerializable(
  createToJson: false,
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class CodesModel {
  final String result;
  @JsonKey(defaultValue: [])
  final List<List<String>> supportedCodes;

  CodesModel({
    required this.result,
    required this.supportedCodes,
  });

  factory CodesModel.fromJson(Map<String, dynamic> json) =>
      _$CodesModelFromJson(json);
}

extension CodesModelExt on CodesModel {
  CodeEntity toDomain() {
    return CodeEntity(codes: supportedCodes.map((e) => e).toList());
  }
}
