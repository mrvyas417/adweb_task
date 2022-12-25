import 'package:get/get.dart';

import '../../../data/datasource/remote/http_request.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HTTP());
  }
}
