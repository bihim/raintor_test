import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_model.freezed.dart';

part 'location_model.g.dart';

@freezed
class LocationModel with _$LocationModel {
  const factory LocationModel({
    double? lat,
    double? lon,
    String? userName,
  }) = _LocationModel;

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
}
