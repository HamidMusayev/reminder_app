import 'package:todo_app/data/enums/work_state.dart';
import 'package:todo_app/data/models/work_duration.dart';

class WorkUpdateEntity {
  final int? id;
  String name;
  WorkState state;
  DateTime startDate;
  DateTime? endDate;
  WorkDuration duration;

  WorkUpdateEntity({
    required this.id,
    required this.name,
    required this.state,
    required this.startDate,
    this.endDate,
    required this.duration,
  });
}
