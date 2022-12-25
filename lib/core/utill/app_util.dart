import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:toast/toast.dart';

class AppUtil {
  //static Dialog? dialog;
  static double buttonWidthInTab = 300;
  static Color? header;
  static Color? footer;

  static showToastMessage(BuildContext context, String message) {
    ToastContext().init(context);
    Toast.show(
      message,
      duration: Toast.lengthLong,
      gravity: Toast.top,
      backgroundColor: Colors.red,
      textStyle: Get.textTheme.headline6?.copyWith(
        fontSize: 14,
        color: Colors.white,
      ),
    );
  }

  static showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: Get.textTheme.headline6
            ?.copyWith(color: Colors.white, fontSize: 13),
      ),
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 2),
    ));
  }

  static showSnackBarError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: Get.textTheme.headline6
            ?.copyWith(color: Colors.white, fontSize: 13),
      ),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 3),
    ));
  }

  static hideKeyBoard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static showErrorSnackBar(String message) {
    Get.snackbar(
      'Error',
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static blueNotificationBar() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }

  static whiteNotificationBar() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }
}
