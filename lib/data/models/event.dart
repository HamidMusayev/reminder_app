import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable()
class Event {
  final int? id;
  final String name;
  final String description;
  final String date;
  final String time;

  Event({
    this.id,
    required this.name,
    required this.description,
    required this.date,
    required this.time,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);
}
