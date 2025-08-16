import 'package:freezed_annotation/freezed_annotation.dart';

part 'metadata_model.freezed.dart';
part 'metadata_model.g.dart';

@freezed
sealed class MetadataModel with _$MetadataModel {
  const factory MetadataModel({
    required int timestamp,
    @JsonKey(name: 'num_cryptocurrencies') required int numCryptocurrencies,
    String? error,
  }) = _MetadataModel;

  factory MetadataModel.fromJson(Map<String, dynamic> json) =>
      _$MetadataModelFromJson(json);
}
