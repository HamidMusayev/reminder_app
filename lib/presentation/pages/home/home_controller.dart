import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/constants/app_durations.dart';
import 'package:todo_app/core/routes/app_routes.dart';
import 'package:todo_app/presentation/pages/home/widgets/work_list/work_list_controller.dart';

class HomeController extends GetxController {
  final PageController pageController = PageController();
  RxnDouble? currentPage = RxnDouble(0);

  @override
  void onInit() {
    pageController.addListener(() => currentPage?.value = pageController.page);
    super.onInit();
  }

  Future<void> onFabPressed() async {
    pageController.page == 0
        ? Get.toNamed(AppRoutes.taskAdd)
        : pageController.page == 1
            ? Get.toNamed(AppRoutes.eventAdd)
            : await Get.find<WorkListController>().startNewWork();
  }

  void onHomeTabPressed(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: AppDurations.d400,
      curve: Curves.easeInOutExpo,
    );
  }
}
