// ignore_for_file: constant_identifier_names, avoid_print

import 'package:connectivity/connectivity.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/datasource/remote/http_request.dart';

enum NetworkState { CONNECTED, DISCONNECTED, UNKNOWN }

class Network {
  static var status = NetworkState.UNKNOWN;
  var httpController = Get.put(HTTP());
  //var controller = Get.put(NetWorkController());

  Network({VoidCallback? onChange}) {
    print('Calling Network');
    Connectivity connectivity = Connectivity();

    if (Network.status == NetworkState.UNKNOWN) {
      connectivity.checkConnectivity().then((ConnectivityResult result) {
        if (result == ConnectivityResult.wifi ||
            result == ConnectivityResult.mobile) {
          status = NetworkState.CONNECTED;
        }
      });
    }

    connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile) {
        status = NetworkState.CONNECTED;
      } else if (result == ConnectivityResult.wifi) {
        status = NetworkState.CONNECTED;
      } else {
        status = NetworkState.DISCONNECTED;
      }
      if (onChange != null) {
        onChange();
      }
    });
  }
}
