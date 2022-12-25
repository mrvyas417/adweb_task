import 'package:task_adweb/data/model/checking_age.dart';

class Dashbaord {
  Dashbaord(
      {required this.id,
      required this.name,
      required this.sallary,
      required this.age,
      required this.ageData,
      required this.profilePic});
  dynamic id;
  String name;
  dynamic age;
  dynamic sallary;
  dynamic ageData;
  dynamic profilePic;

  factory Dashbaord.fromJson(dynamic json) {
    String ageData = "";
    int age = json["employee_age"];
    ageData = Checking.ageCheker(age: age);
    // print("age data $ageData");
    return Dashbaord(
        id: json['id'].toString(),
        name: json['employee_name'] ?? "",
        sallary: json["employee_salary"].toString() + " ₹",
        ageData: ageData.toString(),
        age: age,
        profilePic: "https://cdn-icons-png.flaticon.com/512/4974/4974985.png");
  }
}
