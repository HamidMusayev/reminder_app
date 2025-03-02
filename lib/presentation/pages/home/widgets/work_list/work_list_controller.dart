import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/data/enums/work_state.dart';
import 'package:todo_app/data/models/work_duration.dart';
import 'package:todo_app/domain/entities/work_add_entity.dart';
import 'package:todo_app/domain/entities/work_list_entity.dart';
import 'package:todo_app/domain/entities/work_update_entity.dart';
import 'package:todo_app/domain/usecases/work_add_usecase.dart';
import 'package:todo_app/domain/usecases/work_delete_usecase.dart';
import 'package:todo_app/domain/usecases/work_update_usecase.dart';
import 'package:todo_app/domain/usecases/works_get_usecase.dart';

class WorkListController extends GetxController {
  RxBool isLoading = true.obs;
  List<WorkListEntity> works = [];
  Map<int, Timer> timers = {};
  RxMap<int, Duration> durations = <int, Duration>{}.obs;

  @override
  Future<void> onInit() async {
    await getWorks();

    super.onInit();
  }

  Future<void> createTimer(WorkListEntity work) async {
    final duration = Duration(
      days: work.duration.days,
      hours: work.duration.hours,
      minutes: work.duration.minutes,
      seconds: work.duration.seconds,
      milliseconds: work.duration.milliseconds,
    );

    final timer = Timer.periodic(duration, (timer) {
      durations[work.id]! + Duration(seconds: 1);
      durations.refresh();
    });

    timers.assign(work.id, timer);
  }

  Future<void> createDuration(WorkListEntity work) async {
    final duration = Duration(
      days: work.duration.days,
      hours: work.duration.hours,
      minutes: work.duration.minutes,
      seconds: work.duration.seconds,
      milliseconds: work.duration.milliseconds,
    );

    durations.assign(work.id, duration);
  }

  Future<void> getWorks() async {
    isLoading.value = true;

    works = await Get.find<WorksGetUseCase>().call();

    //create durations for running works
    works.forEach((w) async => await createDuration(w));

    //create timers for running works
    works.forEach((w) async => await createTimer(w));

    isLoading.value = false;
  }

  Future<void> updateWorkState(int workId, WorkState state) async {
    var work = works.firstWhere((w) => w.id == workId);
    var duration = durations[workId]!;

    await Get.find<WorkUpdateUseCase>().call(
      WorkUpdateEntity(
        id: work.id,
        name: work.name,
        state: state,
        startDate: work.startDate,
        duration: WorkDuration(
          days: duration.inDays,
          hours: duration.inHours,
          minutes: duration.inMinutes,
          seconds: duration.inSeconds,
          milliseconds: duration.inMilliseconds,
        ),
      ),
    );

    await getWorks();
  }

  Future<void> startNewWork() async {
    await Get.find<WorkAddUseCase>().call(
      WorkAddEntity(
        name: 'Yeni iş',
        state: WorkState.RUNNING,
        startDate: DateTime.now(),
        duration: WorkDuration(
          days: 0,
          hours: 0,
          minutes: 0,
          seconds: 0,
          milliseconds: 0,
        ),
      ),
    );

    await getWorks();
  }

  Future<void> deleteWork(WorkListEntity work) async {
    await Get.find<WorkDeleteUseCase>().call(work.id);

    await getWorks();

    Get.snackbar(
      backgroundColor: Get.theme.primaryColor,
      colorText: Colors.white,
      'Bildiriş',
      'İş silindi',
      snackPosition: SnackPosition.BOTTOM,
      // mainButton: TextButton(
      //   style: TextButton.styleFrom(foregroundColor: Colors.white),
      //   onPressed: () async => await revertDeleteWork(work),
      //   child: Text('Qaytar'),
      // ),
    );
  }
}
