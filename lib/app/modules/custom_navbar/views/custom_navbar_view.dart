import 'package:fitbody/app/utils/color_constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/custom_navbar_controller.dart';

class CustomNavbarView extends GetView<CustomNavbarController> {
  const CustomNavbarView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Obx(() {
        return controller.fragment[controller.fragmentIndex.value];
      }),
      bottomNavigationBar: Obx(() {
        return SafeArea(
          child: Container(
            height: 65,
            margin: EdgeInsets.only(left: 8, right: 8),
            decoration: BoxDecoration(
              color: AppColors.purple,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(controller.fragment.length, (index) {
                return InkWell(
                  onTap: () {
                    controller.fragmentIndex.value = index;
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      controller.images[index],
                      height: controller.fragmentIndex.value == index ? 32 : 28,
                      width: controller.fragmentIndex.value == index ? 32 : 28,
                      color:
                          controller.fragmentIndex.value == index
                              ? AppColors.yellow
                              : AppColors.white,
                    ),
                  ),
                );
              }),
            ),
          ),
        );
      }),
    );
  }
}
