import 'dart:convert';
import 'dart:developer';
import 'package:employee/models/employee_model.dart';
import 'package:http/http.dart' as http;

class Api_Handler {
  static Future<List<dynamic>> getData(
      {required String target, String? limit}) async {
    try {
      var url = 'http://192.168.0.145:7070/$target';
      var res = await http.get(Uri.parse(url));
      var data = jsonDecode(res.body);
      print(data);
      List tempList = [];
      if (res.statusCode != 200) {
        throw data["message"];
      }
      for (var v in data) {
        tempList.add(v);
      }
      // print(data);
      return tempList;
    } catch (error) {
      log("An error occured $error.");
      throw error.toString();
    }
  }

  static Future<List<EmployeeModel>> getAll() async {
    List temp = await getData(target: "");
    return EmployeeModel.employeeFromSnapshot(temp);
  }

  static Future<EmployeeModel> getEmployee({required String id}) async {
    try {
      var uri = 'http://192.168.0.145:7070/$id';
      var res = await http.get(Uri.parse(uri));
      var data = jsonDecode(res.body);
      if (res.statusCode != 200) {
        throw data["message"];
      }
      return EmployeeModel.fromJson(data);
    } catch (error) {
      log("An error occured $error.");
      throw error.toString();
    }
  }
}
