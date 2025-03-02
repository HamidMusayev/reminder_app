import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/constants/app_paddings.dart';
import 'package:todo_app/core/constants/app_radiuses.dart';
import 'package:todo_app/data/enums/work_state.dart';
import 'package:todo_app/presentation/pages/home/widgets/work_list/work_list_controller.dart';

class WorkList extends GetView<WorkListController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : controller.works.isEmpty
              ? Center(
                  child: Text(
                    'Məlumat yoxdur',
                    style: TextStyle(
                      color: Colors.black26,
                    ),
                  ),
                )
              : ListView.builder(
                  padding: AppPaddings.p16,
                  itemCount: controller.works.length,
                  itemBuilder: (context, index) => Card(
                    margin: AppPaddings.p4,
                    elevation: 0,
                    color: Colors.white,
                    child: ListTile(
                      onTap: () {},
                      shape:
                          RoundedRectangleBorder(borderRadius: AppRadiuses.r18),
                      title: Text(
                        '15:00:30',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                      ),
                      subtitle: Text(
                        controller.works[index].name,
                        style: TextStyle(fontSize: 12),
                      ),
                      trailing: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          controller.works[index].state == WorkState.PAUSED
                              ? IconButton.filled(
                                  icon: Icon(Icons.play_arrow_rounded),
                                  style: IconButton.styleFrom(
                                    backgroundColor: Colors.green.shade50,
                                    foregroundColor: Colors.green,
                                  ),
                                  onPressed: () async =>
                                      await controller.updateWorkState(
                                    controller.works[index].id,
                                    WorkState.RUNNING,
                                  ),
                                )
                              : SizedBox(),
                          controller.works[index].state == WorkState.RUNNING
                              ? IconButton(
                                  icon: Icon(Icons.pause_rounded),
                                  style: IconButton.styleFrom(
                                    backgroundColor: Colors.orange.shade50,
                                    foregroundColor: Colors.orange,
                                  ),
                                  onPressed: () async =>
                                      await controller.updateWorkState(
                                    controller.works[index].id,
                                    WorkState.PAUSED,
                                  ),
                                )
                              : SizedBox(),
                          controller.works[index].state == WorkState.RUNNING ||
                                  controller.works[index].state ==
                                      WorkState.PAUSED
                              ? IconButton(
                                  icon: Icon(Icons.stop_rounded),
                                  style: IconButton.styleFrom(
                                    backgroundColor: Colors.red.shade50,
                                    foregroundColor: Colors.red,
                                  ),
                                  onPressed: () async =>
                                      await controller.updateWorkState(
                                    controller.works[index].id,
                                    WorkState.STOPPED,
                                  ),
                                )
                              : SizedBox(),
                        ],
                      ),
                      // leading: SizedBox(
                      //   width: 100,
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.end,
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Text(controller.works[index].startDate.toString()),
                      //       Text('controller.works[index].time'),
                      //     ],
                      //   ),
                      // ),
                    ),
                  ),
                ),
    );
  }
}
