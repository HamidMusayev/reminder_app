import 'package:todo_app/data/models/work.dart';
import 'package:todo_app/domain/entities/work_add_entity.dart';
import 'package:todo_app/domain/entities/work_list_entity.dart';
import 'package:todo_app/domain/entities/work_update_entity.dart';

class WorkMapper {
  static Work fromListEntity(WorkListEntity entity) {
    return Work(
      id: entity.id,
      name: entity.name,
      state: entity.state,
      startDate: entity.startDate,
      endDate: entity.endDate,
      elapsedMilliseconds: entity.elapsedMilliseconds,
    );
  }

  static Work fromAddEntity(WorkAddEntity entity) {
    return Work(
      name: entity.name,
      state: entity.state,
      startDate: entity.startDate,
      elapsedMilliseconds: entity.elapsedMilliseconds,
    );
  }

  static Work fromUpdateEntity(WorkUpdateEntity entity) {
    return Work(
      id: entity.id,
      name: entity.name,
      state: entity.state,
      startDate: entity.startDate,
      endDate: entity.endDate,
      elapsedMilliseconds: entity.elapsedMilliseconds,
    );
  }

  static WorkListEntity fromWork(Work model) {
    return WorkListEntity(
      id: model.id!,
      name: model.name,
      state: model.state,
      startDate: model.startDate,
      endDate: model.endDate,
      elapsedMilliseconds: model.elapsedMilliseconds,
    );
  }
}
