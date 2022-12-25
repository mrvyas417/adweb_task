// ignore_for_file: prefer_equal_for_default_values, prefer_is_empty

import 'dart:convert' as convert;
import 'dart:developer';

import 'package:action_broadcast/action_broadcast.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../config/other/preferences.dart';
import '../../../core/loader/loader_controller.dart';
import '../../../core/network/network.dart';

import '../../../core/utill/app_util.dart';

const _timeoutDuration = Duration(seconds: 350);

class HTTP {
  getRequest(BuildContext context,
      {bool showLoader = false,
      required String api,
      bool offlineSupport = false,
      offlineData: (dynamic),
      success: (dynamic),
      failure: (String)}) async {
    // 1. checking offline data
    bool offlineDataFound = false;
    if (offlineSupport == true) {
      final cachedResponse = await Pref.getAPIResponse(api: api);

      if (cachedResponse.length > 0) {
        offlineDataFound = true;

        var response = convert.jsonDecode(cachedResponse);

        offlineData(response);
      }
    }

    if (Network.status == NetworkState.DISCONNECTED) {
      // print(Network.status);
      failure("No active internet connection");
      return;
    }

    if (showLoader == true && offlineDataFound == false) {
      Get.find<LoaderController>().showLoader.value = true;
    }

    try {
      Map<String, String> headers = {};

      headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
      };

      final apiUrl = Uri.encodeFull(api);
      final uri = Uri.parse(apiUrl);
      var response =
          await http.get(uri, headers: headers).timeout(_timeoutDuration);
      log("JSON => ${response.body}");
      if (showLoader == true) {
        //AppUtil.dialogHide(context);
        Get.find<LoaderController>().showLoader.value = false;
      }
      var jsonResponse = convert.jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (offlineSupport == true) {
          Pref.setAPIResponse(responseBody: response.body, api: api);
        }

        success(jsonResponse);
      } else {
        AppUtil.showSnackBarError(context, "");
      }
    } on TimeoutException catch (_) {
      if (showLoader == true) {
        Get.find<LoaderController>().showLoader.value = false;
      }
      if (offlineDataFound == false) {
        failure("Unable to connect to the server");
      }
    } catch (error) {
      if (showLoader == true) {
        Get.find<LoaderController>().showLoader.value = false;
      }
      // print('error => ${error.toString()}');
    }
  }
}
