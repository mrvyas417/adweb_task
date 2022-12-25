// ignore_for_file: must_be_immutable

import 'dart:async';
import 'package:flutter/material.dart';
import '../loader/http_loader.dart';
import 'network.dart';

class NetworkChange extends StatefulWidget {
  Widget child;

  NetworkChange({super.key, required this.child});

  @override
  createState() => NetworkChangeState();
}

class NetworkChangeState extends State<NetworkChange> {
  bool timeOverHideTheWidget = false;
  bool startUpdatingLayoutAccordingToStatus = false;
  bool isAppLaunchesFirstTime = true;

  @override
  void initState() {
    super.initState();
    Network(onChange: () {
      if (Network.status == NetworkState.CONNECTED) {
        timeOverHideTheWidget = false;
      } else {
        isAppLaunchesFirstTime = false;
      }
      startUpdatingLayoutAccordingToStatus = true;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return HTTPLoader(
      child: Column(
        children: [
          Expanded(child: widget.child),
          if (Network.status == NetworkState.UNKNOWN ||
              Network.status == NetworkState.DISCONNECTED) ...[
            _networkNotAvailable(),
          ] else ...[
            _networkAvailable(),
          ]
        ],
      ),
    );
  }

  Widget _networkAvailable() {
    if (startUpdatingLayoutAccordingToStatus == false ||
        isAppLaunchesFirstTime == true) {
      return Container();
    }
    if (timeOverHideTheWidget == false) {
      Timer(const Duration(seconds: 3), () {
        setState(() {
          timeOverHideTheWidget = true;
        });
      });
    } else {
      return Container();
    }
    return Container(
      width: double.maxFinite,
      height: 22,
      color: Colors.green,
      child: Center(
        child: Text(
          "Back online",
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }

  Widget _networkNotAvailable() {
    if (isAppLaunchesFirstTime == true) {
      return Container();
    }
    return Container(
      width: double.maxFinite,
      height: 22,
      color: Colors.black,
      child: Center(
        child: Text(
          "No connection",
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }
}
