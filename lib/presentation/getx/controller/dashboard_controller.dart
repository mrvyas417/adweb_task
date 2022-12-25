// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:task_adweb/imports.dart';

class DashboardController extends GetxController {
  var httpController = Get.find<HTTP>();
  BuildContext context;

  DashboardController(this.context);
  var employeeData = <Dashbaord>[].obs;
  var isAPiCalling = false.obs;
  List isExpand = [].obs;

  @override
  void onInit() {
    super.onInit();

    dashbaordData();
  }

  dashbaordData() async {
    var api = API.getEmployeeData;
    httpController.getRequest(context, api: api, showLoader: false,
        success: (jsonData) {
      _handleResponse(jsonData);
    }, failure: (err) {
      //  print("err $err");
    });
  }

  _handleResponse(dynamic jsonData) {
    var result = jsonData["data"] as List;
    employeeData.clear();
    var data;
    for (Map<String, dynamic> i in result) {
      data = Dashbaord.fromJson(i);
      employeeData.add(data);
    }

    // walletList.sort((a, b) => (a.name.compareTo(b.name)));
  }
}
