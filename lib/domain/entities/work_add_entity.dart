import 'package:todo_app/data/enums/work_state.dart';

class WorkAddEntity {
  String name;
  WorkState state;
  DateTime startDate;
  int elapsedMilliseconds;

  WorkAddEntity({
    required this.name,
    required this.state,
    required this.startDate,
    required this.elapsedMilliseconds,
  });
}
