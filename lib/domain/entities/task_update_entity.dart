class TaskUpdateEntity {
  final int id;
  String name;
  String date;
  int isDone;

  TaskUpdateEntity({
    required this.id,
    required this.name,
    required this.date,
    required this.isDone,
  });
}
