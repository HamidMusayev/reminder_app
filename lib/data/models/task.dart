import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()
class Task {
  final int? id;
  final String name;
  final String date;
  final int isDone;

  Task({
    this.id,
    required this.name,
    required this.date,
    required this.isDone,
  });

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
