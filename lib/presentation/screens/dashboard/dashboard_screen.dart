import 'package:task_adweb/imports.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(DashboardController(context));

    return BaseScaffold(
        child: Scaffold(
            appBar: AppWidgets.appBar(title: "Adweb Task"),
            body: SingleChildScrollView(
              child: Obx((() {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.employeeData.length,
                    itemBuilder: ((context, index) {
                      return DashbaordWidgets.dataLIst(
                          controller: controller, index: index);
                    }),
                  ),
                );
              })),
            )));
  }
}
