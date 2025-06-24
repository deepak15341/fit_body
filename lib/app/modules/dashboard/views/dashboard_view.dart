import 'package:fitbody/app/utils/strings.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/color_constants.dart';
import '../../../utils/widgets/text_widgets.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${Strings.hi}${Strings.deepak}',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 10,
                        style: TextWidgets.textStyle(
                          fontSize: 24,
                          fontColor: AppColors.purple,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        Strings.challengeLimits,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        maxLines: 10,
                        style: TextWidgets.textStyle(
                          fontSize: 16,
                          fontColor: AppColors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: List.generate(controller.icons.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(
                        controller.icons[index],
                        color: AppColors.purple,
                      ),
                    );
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
