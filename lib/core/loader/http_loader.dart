// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'loader.dart';
import 'loader_controller.dart';

class HTTPLoader extends StatelessWidget {
  Widget child;

  HTTPLoader({super.key, required this.child});

  var controller = Get.put(LoaderController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: [
          child,
          Obx(() => Visibility(
              visible: controller.showLoader.value, child: const Loader())),
        ],
      ),
    );
  }
}
