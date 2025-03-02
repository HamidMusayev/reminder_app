import 'package:todo_app/data/datasources/local_datasource.dart';
import 'package:todo_app/data/models/work.dart';
import 'package:todo_app/data/models/work_duration.dart';
import 'package:todo_app/data/repositories/work_repository.dart';

class WorkRepositoryImpl implements WorkRepository {
  @override
  Future<List<Work>> get() async {
    final works = await LocalDataSource.rawQuery('''
      SELECT works.*, work_durations.days, work_durations.hours, work_durations.minutes, work_durations.seconds, work_durations.milliseconds
      FROM works
      INNER JOIN work_durations ON works.durationId = work_durations.id
    ''');

    return works.map((work) {
      final duration = WorkDuration(
        days: work['days'],
        hours: work['hours'],
        minutes: work['minutes'],
        seconds: work['seconds'],
        milliseconds: work['milliseconds'],
      );
      return Work.fromJson({
        ...work,
        'duration': duration.toJson(),
      });
    }).toList();
  }

  @override
  Future<void> add(Work work) async {
    final durationId =
        await LocalDataSource.add('work_durations', work.duration.toJson());
    await LocalDataSource.add('works', {
      ...work.toJson(),
      'durationId': durationId,
    });
  }

  @override
  Future<void> delete(int id) async {
    final work = await LocalDataSource.getById('works', id);
    await LocalDataSource.delete('work_durations', work!['durationId']);
    await LocalDataSource.delete('works', id);
  }

  @override
  Future<void> update(Work work) async {
    await LocalDataSource.update(
        'work_durations', work.duration.toJson(), work.duration.id!);
    await LocalDataSource.update('works', work.toJson(), work.id!);
  }
}
