import 'package:todo_app/data/mappers/task_mapper.dart';
import 'package:todo_app/data/repositories/task_repository.dart';
import 'package:todo_app/domain/entities/task_update_entity.dart';

class TaskUpdateUseCase {
  final TaskRepository repository;

  TaskUpdateUseCase(this.repository);

  Future<void> call(TaskUpdateEntity task) async {
    await repository.update(TaskMapper.fromUpdateEntity(task));
  }
}
