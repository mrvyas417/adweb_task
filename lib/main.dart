import 'package:flutter/material.dart';

import 'presentation/screens/base/my_app.dart';

/// This function only work in release mode not work in debugging mode(e.g. run your application in debug
/// and then background it by switching apps so it's no longer in the foreground.)

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //final appleSignInAvailable = await AppleSignInAvailable.check();

  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}
