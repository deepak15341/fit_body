import 'package:fitbody/app/modules/dashboard/views/dashboard_view.dart';
import 'package:fitbody/app/utils/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomNavbarController extends GetxController {
  List<Widget> fragment = [
    DashboardView(),
    DashboardView(),
    DashboardView(),
    DashboardView(),
  ];
  List images = [
    IP.navbar1,
    IP.navbar2,
    IP.navbar3,
    IP.navbar4,
  ];

  Rx<int> fragmentIndex = 0.obs;
}
