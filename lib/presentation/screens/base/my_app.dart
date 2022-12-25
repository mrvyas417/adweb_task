import 'package:task_adweb/imports.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final materialAppKey = GlobalKey();
  // var controller = Get.put(AuthController());

  @override
  void initState() {
    //   print('init');
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    AppUtil.whiteNotificationBar();

    //_loginState();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //print('build isUserLoggedIn =>$isUserLoggedIn');
    return NetworkChange(
      child: _materialApp(),
    );
  }

  Widget _materialApp() {
    return FutureBuilder(
        future: callAPI(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // print('if app created done');
            return GetMaterialApp(
              color: Colors.white,
              debugShowCheckedModeBanner: false,
              key: materialAppKey,
              theme: AppTheme.appLightTheme,
              initialRoute: AppRoutes.DASHBOARD,
              getPages: AppPages.routes,
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: AppColors.scaffoldColor,
              height: 200,
              alignment: Alignment.center,
              child: const SizedBox(
                height: 100,
                width: 100,
                child: LoadingIndicator(
                  indicatorType: Indicator.orbit,
                  strokeWidth: 1,
                  backgroundColor: AppColors.scaffoldColor,
                ),
              ),
            );
          } else {
            // print('else app created');
            return Container(
              color: Colors.white,
            );
          }
        });
  }

  callAPI() async {}
}
