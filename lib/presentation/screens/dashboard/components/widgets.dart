import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:task_adweb/data/model/checking_age.dart';

import '../../../../config/other/app_colors.dart';
import '../../../getx/controller/dashboard_controller.dart';

class DashbaordWidgets {
  static Widget cacheImage({
    required DashboardController controller,
    required int index,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CachedNetworkImage(
        width: 50,
        imageUrl: controller.employeeData[index].profilePic,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }

  static Widget textWidget(controller, index) {
    return Text(
      controller.employeeData[index].sallary,
      style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
    );
  }

  static Widget dataLIst(
      {required DashboardController controller, required index}) {
    return ExpansionTile(
      trailing: Obx((() {
        return Icon(
          (controller.isExpand.contains(index))
              ? Icons.keyboard_arrow_down
              : Icons.keyboard_arrow_up,
          color: AppColors.descriptionBlack,
        );
      })),
      onExpansionChanged: (value) {
        if (value) {
          controller.isExpand.add(index);
        } else {
          controller.isExpand.remove(index);
        }
      },
      title: Text(
        controller.employeeData[index].ageData,
        style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: AppColors.darkPrimary),
      ),
      children: <Widget>[
        Column(
          children: [
            DashbaordWidgets.textWidget(controller, index),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    DashbaordWidgets.cacheImage(
                        controller: controller, index: index),
                    DashbaordWidgets.nameTextWidget(
                        controller: controller, index: index)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DashbaordWidgets.circleContainer(
                        controller: controller, iFirst: true, index: index),
                    const SizedBox(
                      width: 10,
                    ),
                    DashbaordWidgets.circleContainer(
                        controller: controller, iFirst: false, index: index),
                  ],
                ),
                Row(
                  children: [
                    DashbaordWidgets.cacheImage(
                        controller: controller, index: index),
                    DashbaordWidgets.nameTextWidget(
                        controller: controller, index: index)
                  ],
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  static Widget circleContainer(
      {required DashboardController controller,
      required int index,
      required bool iFirst}) {
    return Container(
      alignment: Alignment.topCenter,
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
            color: AppColors.pinkColor, borderRadius: BorderRadius.circular(100)
            //more than 50% of width makes circle
            ),
        child: Center(
          child: Text(
            (iFirst)
                ? Checking.firstDigit(controller.employeeData[index].age)
                : Checking.lastDigit(controller.employeeData[index].age),
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ),
    );
  }

  static Widget nameTextWidget({
    required DashboardController controller,
    required int index,
  }) {
    return SizedBox(
      width: 60,
      child: Text(
        maxLines: 2,
        style: const TextStyle(fontSize: 16, color: AppColors.descriptionBlack),
        controller.employeeData[index].name,
      ),
    );
  }
}
