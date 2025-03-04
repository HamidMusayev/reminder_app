import 'package:todo_app/data/enums/work_state.dart';

class WorkListEntity {
  final int id;
  String name;
  WorkState state;
  DateTime startDate;
  DateTime? endDate;
  int elapsedMilliseconds;

  WorkListEntity({
    required this.id,
    required this.name,
    required this.state,
    required this.startDate,
    this.endDate,
    required this.elapsedMilliseconds,
  });
}
