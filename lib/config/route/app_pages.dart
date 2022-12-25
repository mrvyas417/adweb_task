// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../../presentation/screens/dashboard/dashboard_screen.dart';

import 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.LENDING;

  static final routes = [
    GetPage(
      name: AppRoutes.LENDING,
      page: () => const DashBoardScreen(),
      // middlewares: [AuthGuard()],
    ),
    GetPage(name: AppRoutes.DASHBOARD, page: () => const DashBoardScreen()),
  ];
}
