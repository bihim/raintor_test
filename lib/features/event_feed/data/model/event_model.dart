import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_model.freezed.dart';

part 'event_model.g.dart';

List<EventModel> eventModelFromJson(String str) => List<EventModel>.from(
      json
              .decode(str)
              .map((x) => EventModel.fromJson(x as Map<String, dynamic>))
          as Iterable<dynamic>,
    );

String eventModelToJson(List<EventModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class EventModel with _$EventModel {
  const factory EventModel({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) = _EventModel;

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);
}
