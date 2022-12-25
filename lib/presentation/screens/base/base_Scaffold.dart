// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  Widget child;

  BaseScaffold({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: child,
    );
  }
}
