import 'package:json_annotation/json_annotation.dart';
import 'package:todo_app/data/enums/work_state.dart';
import 'package:todo_app/data/models/work_duration.dart';

part 'work.g.dart';

@JsonSerializable()
class Work {
  final int? id;
  final String name;
  final WorkState state;
  final DateTime startDate;
  final DateTime? endDate;
  final WorkDuration duration;

  Work({
    this.id,
    required this.name,
    required this.state,
    required this.startDate,
    this.endDate,
    required this.duration,
  });

  factory Work.fromJson(Map<String, dynamic> json) => _$WorkFromJson(json);

  Map<String, dynamic> toJson() => _$WorkToJson(this);
}
