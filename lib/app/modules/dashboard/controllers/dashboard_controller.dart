import 'package:fitbody/app/routes/app_pages.dart';
import 'package:fitbody/app/utils/image_paths.dart';
import 'package:fitbody/app/utils/strings.dart';
import 'package:fitbody/app/utils/widgets/snack_bar/snack_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  List<IconData> appBarIcons = [
    Icons.search,
    Icons.notifications,
    Icons.person,
  ];
  List<String> topImages = [
    IP.dumbbell,
    IP.progressTracking,
    IP.nutrition,
    IP.community,
  ];
  List<String> cardImage = [IP.dashboardCard1, IP.dashboardCard2];
  List<String> articleImageList = [IP.article1, IP.article2];
  Rx<String> selectedTopImage = Strings.empty.obs;
  List<List<IconData>> dashboardCardInnerIcons = [
    [Icons.circle, Icons.local_fire_department_rounded],
    [Icons.circle, Icons.local_fire_department_rounded],
  ];

  onDashboardIconTap(int index, BuildContext context) {
    switch (index) {
      case 0:
        {
          showSnack(
            context: context,
            messageType: MessageType.success("search"),
          );
        }
      case 1:
        {
          showSnack(
            context: context,
            messageType: MessageType.success("notification"),
          );
        }
      default:
        {
          Get.toNamed(Routes.profileScreen);
        }
    }
  }
}
