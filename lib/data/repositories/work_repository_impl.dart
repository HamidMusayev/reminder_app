import 'package:todo_app/data/datasources/local_datasource.dart';
import 'package:todo_app/data/models/work.dart';
import 'package:todo_app/data/repositories/work_repository.dart';

class WorkRepositoryImpl implements WorkRepository {
  @override
  Future<List<Work>> get() async {
    final works = await LocalDataSource.get('works');
    return works.map((work) => Work.fromJson(work)).toList();
  }

  @override
  Future<void> add(Work work) async {
    await LocalDataSource.add('works', work.toJson());
  }

  @override
  Future<void> delete(int id) async {
    await LocalDataSource.delete('works', id);
  }

  @override
  Future<void> update(Work work) async {
    await LocalDataSource.update('works', work.toJson(), work.id!);
  }
}
