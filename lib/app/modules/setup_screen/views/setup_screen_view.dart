import 'package:fitbody/app/utils/color_constants.dart';
import 'package:fitbody/app/utils/image_paths.dart';
import 'package:fitbody/app/utils/strings.dart';
import 'package:fitbody/app/utils/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/widgets/custom_button.dart';
import '../../../utils/widgets/text_widgets.dart';
import '../controllers/setup_screen_controller.dart';

class SetupScreenView extends GetView<SetupScreenController> {
  const SetupScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: controller.fragmentIndex.value!=0 ? customAppBar(title: Strings.back) :null,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Image.asset(IP.setupBackground1),
                SizedBox(height: height * 0.02),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    Strings.setUpDescription,
                    textAlign: TextAlign.center,
                    style: TextWidgets.textStyle(
                      fontSize: 32,
                      fontColor: AppColors.yellow,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.04),
                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(left: 14, right: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: AppColors.purple,
                  ),
                  child: Text(
                    controller.setupDescription,
                    textAlign: TextAlign.center,
                    style: TextWidgets.textStyle(
                      fontSize: 16,
                      fontColor: AppColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.25,
              vertical: height * 0.04,
            ),
            child: CustomButton(
              text: Strings.next,
              height: height * 0.05,
              buttonTextSize: 18,
              fw: FontWeight.w600,
              onTap: () {
                controller.onTapNext();
              },
            ),
          ),
        ],
      ),
    );
  }
}
