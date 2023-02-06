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

  static Future<EmployeeModel> registerEmployee({
    required String id,
    required String name,
    required String salary,
    required String location,
  }) async {
    try {
      var uri = 'http://192.168.0.145:7070/';
      Map<String, String> mp = {
        "id": id,
        "name": name,
        "salary": salary,
        "location": location,
      };
      String jsonEncoded = jsonEncode(mp);
      var res = await http.post(Uri.parse(uri), body: jsonEncoded);
      var data = jsonDecode(res.body);
      return EmployeeModel.fromJson(data);
    } catch (error) {
      log("An error occured $error.");
      throw error.toString();
    }
  }

  static Future<EmployeeModel> updateEmployee({
    required String id,
    required String name,
    required String location,
    required String salary,
  }) async {
    try {
      var uri = 'http://192.168.0.145:7070/$id';
      Map<String, String> mp = {
        "id": id,
        "name": name,
        "salary": salary,
        "location": location,
      };
      String jsonEncoded = jsonEncode(mp);
      var res = await http.put(Uri.parse(uri), body: jsonEncoded);
      var data = jsonDecode(res.body);
      return EmployeeModel.fromJson(data);
    } catch (error) {
      log("An error occured $error.");
      throw error.toString();
    }
  }

  static Future<EmployeeModel> deleteEmployee({required String id}) async {
    try {
      var uri = 'http://192.168.0.145:7070/$id';
      var res = await http.delete(Uri.parse(uri));
      var data = jsonDecode(res.body);
      return EmployeeModel.fromJson(data);
    } catch (error) {
      log("An error occured $error.");
      throw error.toString();
    }
  }
}
