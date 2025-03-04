import 'package:json_annotation/json_annotation.dart';
import 'package:todo_app/data/enums/work_state.dart';

part 'work.g.dart';

@JsonSerializable()
class Work {
  final int? id;
  final String name;
  final WorkState state;
  final DateTime startDate;
  final DateTime? endDate;
  final int elapsedMilliseconds;

  Work({
    this.id,
    required this.name,
    required this.state,
    required this.startDate,
    this.endDate,
    required this.elapsedMilliseconds,
  });

  factory Work.fromJson(Map<String, dynamic> json) => _$WorkFromJson(json);

  Map<String, dynamic> toJson() => _$WorkToJson(this);
}
