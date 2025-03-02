import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/constants/app_spaces.dart';
import 'package:todo_app/core/constants/app_paddings.dart';
import 'package:todo_app/core/constants/app_radiuses.dart';
import 'package:todo_app/core/utils/date_time_utils.dart';
import 'package:todo_app/presentation/pages/home/widgets/event_list/event_list.dart';
import 'package:todo_app/presentation/pages/home/home_controller.dart';
import 'package:todo_app/presentation/pages/home/widgets/home_appbar_action.dart';
import 'package:todo_app/presentation/pages/home/widgets/home_tab_button.dart';
import 'package:todo_app/presentation/pages/home/widgets/task_list/task_list.dart';
import 'package:todo_app/presentation/pages/home/widgets/work_list/work_list.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await controller.onFabPressed(),
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Xoş gəldin, Həmid!'),
        actions: [HomeAppbarAction()],
      ),
      body: Stack(
        children: [
          Positioned(
            right: 12,
            child: Text(
              DateTime.now().day.toString(),
              style: TextStyle(
                fontSize: 140,
                color: Colors.black12,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSpaces.h32,
              Padding(
                padding: AppPaddings.p20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateTimeUtils.monthName(),
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      DateTimeUtils.weekdayName(),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black45,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: AppPaddings.p20,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Axtarış...',
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Get.theme.primaryColor,
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: AppRadiuses.r18,
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: AppRadiuses.r18,
                      borderSide: BorderSide(color: Get.theme.primaryColor),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: AppPaddings.p20,
                child: Obx(
                  () => Wrap(
                    spacing: 12,
                    runSpacing: 6,
                    children: [
                      HomeTabButton(
                        text: 'Tapşırıqlar',
                        icon: Icons.task_alt_rounded,
                        isActive: controller.currentPage!.value! < 0.5,
                        onPressed: () => controller.onHomeTabPressed(0),
                      ),
                      HomeTabButton(
                        text: 'Hadisələr',
                        icon: Icons.event_available_rounded,
                        isActive: controller.currentPage!.value! > 0.5 &&
                            controller.currentPage!.value! < 1.5,
                        onPressed: () => controller.onHomeTabPressed(1),
                      ),
                      HomeTabButton(
                        text: 'İşlər',
                        icon: Icons.timelapse_rounded,
                        isActive: controller.currentPage!.value! > 1.5,
                        onPressed: () => controller.onHomeTabPressed(2),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: controller.pageController,
                  children: [
                    TaskList(),
                    EventList(),
                    WorkList(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
