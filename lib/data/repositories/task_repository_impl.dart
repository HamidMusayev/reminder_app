import 'package:todo_app/data/datasources/local_datasource.dart';
import 'package:todo_app/data/models/task.dart';
import 'package:todo_app/data/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  @override
  Future<List<Task>> get() async {
    final tasks = await LocalDataSource.get('tasks');
    return tasks.map((task) => Task.fromJson(task)).toList();
  }

  @override
  Future<void> add(Task task) async {
    await LocalDataSource.add('tasks', task.toJson());
  }

  @override
  Future<void> delete(int id) async {
    await LocalDataSource.delete('tasks', id);
  }

  @override
  Future<void> update(Task task) async {
    await LocalDataSource.update('tasks', task.toJson(), task.id!);
  }
}
