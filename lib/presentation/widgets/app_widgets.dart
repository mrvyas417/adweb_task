import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../config/other/app_colors.dart';

import '../../core/utill/app_util.dart';

class AppWidgets {
  static PreferredSize appBar({
    required String title,
    bool backSupport = false,
    bool createbutton = false,
    VoidCallback? onPressed,
    VoidCallback? createClick,
  }) {
    return PreferredSize(
      preferredSize: const Size(1, 50),
      child: Material(
        elevation: 2.0,
        color: (AppUtil.header == null) ? Colors.white : AppUtil.header,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title,
                      textAlign: TextAlign.center,
                      style: Get.textTheme.headline6!
                          .copyWith(fontWeight: FontWeight.w500, fontSize: 18)),
                ],
              ),
            ),
            if (backSupport)
              InkWell(
                onTap: onPressed,
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Icon(Icons.arrow_back),
                ),
              ),
            if (createbutton)
              Positioned(
                right: 10,
                child: Text(
                  'Create',
                  textAlign: TextAlign.center,
                  style: Get.textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: AppColors.greenDark,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
