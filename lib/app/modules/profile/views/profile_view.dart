import 'package:fitbody/app/utils/color_constants.dart';
import 'package:fitbody/app/utils/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/image_paths.dart';
import '../../../utils/strings.dart';
import '../../../utils/widgets/text_widgets.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: customAppBar(
        title: Strings.profile,
        titleColor: Colors.white,
        backgroundColor: AppColors.purple,
        centreTitle: false,
        titleSize: 22,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: width,
                padding: EdgeInsets.only(bottom: 40),
                decoration: BoxDecoration(
                  color: AppColors.purple,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(150),
                      child: Image.asset(
                        IP.deepakImg,
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Text(
                      Strings.deepakKr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      maxLines: 10,
                      style: TextWidgets.textStyle(
                        fontSize: 22,
                        fontColor: AppColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      Strings.deepakEmail,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      maxLines: 10,
                      style: TextWidgets.textStyle(
                        fontSize: 14,
                        fontColor: AppColors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      Strings.deepakDOB,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      maxLines: 10,
                      style: TextWidgets.textStyle(
                        fontSize: 14,
                        fontColor: AppColors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: ListView(children: [])),
            ],
          ),
          Positioned(
            top: 205,
            right: 50,
            left: 50,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.violet,
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
              child: Row(
                children: List.generate(Strings.profileRowTexts.length, (
                  index,
                ) {
                  return Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if (index != 0)
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            height: 50,
                            width: 1,
                            color: AppColors.white,
                          ),
                        Expanded(
                          child: _buildProfileColumn(
                            title: Strings.profileRowTexts[index],
                            subtitle: Strings.profileRowTexts1[index],
                            height: height,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileColumn({
    required String title,
    required String subtitle,
    required double height,
  }) {
    return Column(
      children: [
        Text(
          title,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextWidgets.textStyle(
            fontSize: 16,
            fontColor: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: height * 0.005),
        Text(
          subtitle,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextWidgets.textStyle(
            fontSize: 14,
            fontColor: AppColors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
