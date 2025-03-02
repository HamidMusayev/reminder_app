import 'package:json_annotation/json_annotation.dart';

part 'work_duration.g.dart';

@JsonSerializable()
class WorkDuration {
  final int? id;
  int days;
  int hours;
  int minutes;
  int seconds;
  int milliseconds;

  WorkDuration({
    this.id,
    required this.days,
    required this.hours,
    required this.minutes,
    required this.seconds,
    required this.milliseconds,
  });

  factory WorkDuration.fromJson(Map<String, dynamic> json) =>
      _$WorkDurationFromJson(json);

  Map<String, dynamic> toJson() => _$WorkDurationToJson(this);
}
