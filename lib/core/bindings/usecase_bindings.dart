import 'package:get/get.dart';
import 'package:todo_app/domain/usecases/delete_event_usecase.dart';
import 'package:todo_app/domain/usecases/delete_task_usecase.dart';
import 'package:todo_app/domain/usecases/get_events_usecase.dart';
import 'package:todo_app/domain/usecases/get_tasks_usecase.dart';
import 'package:todo_app/domain/usecases/insert_event_usecase.dart';
import 'package:todo_app/domain/usecases/insert_task_usecase.dart';
import 'package:todo_app/domain/usecases/update_event_usecase.dart';
import 'package:todo_app/domain/usecases/update_task_usecase.dart';

class UsecaseBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetEventsUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => InsertEventUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => DeleteEventUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => UpdateEventUseCase(Get.find()), fenix: true);

    Get.lazyPut(() => GetTasksUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => InsertTaskUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => DeleteTaskUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => UpdateTaskUseCase(Get.find()), fenix: true);
  }
}
