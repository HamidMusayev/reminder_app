import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:todo_app/data/enums/work_state.dart';
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
  Map<int, StopWatchTimer> stopwatches = {};

  @override
  Future<void> onInit() async {
    await getWorks();

    super.onInit();
  }

  Future<void> createStopwatch(WorkListEntity work) async {
    final stopwatch = StopWatchTimer();

    stopwatch.setPresetTime(mSec: work.elapsedMilliseconds);

    if (work.state == WorkState.RUNNING) {
      stopwatch.onStartTimer();
    }

    stopwatches[work.id] = stopwatch;
  }

  Future<void> getWorks() async {
    isLoading.value = true;

    works = await Get.find<WorksGetUseCase>().call();

    works.forEach((w) async => await createStopwatch(w));

    isLoading.value = false;
  }

  Future<void> updateWorkState(int workId, WorkState state) async {
    final work = works.firstWhere((w) => w.id == workId);
    final stopWatch = stopwatches[workId]!;

    final duration = Duration(milliseconds: await stopWatch.rawTime.first);

    await Get.find<WorkUpdateUseCase>().call(
      WorkUpdateEntity(
        id: work.id,
        name: work.name,
        state: state,
        startDate: work.startDate,
        elapsedMilliseconds: duration.inMilliseconds,
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
        elapsedMilliseconds: 0,
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
