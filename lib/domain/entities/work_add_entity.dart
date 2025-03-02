import 'package:todo_app/data/enums/work_state.dart';
import 'package:todo_app/data/models/work_duration.dart';

class WorkAddEntity {
  String name;
  WorkState state;
  DateTime startDate;
  WorkDuration duration;

  WorkAddEntity({
    required this.name,
    required this.state,
    required this.startDate,
    required this.duration,
  });
}
