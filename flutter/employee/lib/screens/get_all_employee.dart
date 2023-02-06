import 'package:employee/models/employee_model.dart';
import 'package:employee/services/api_handler.dart';
import 'package:employee/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EmployeeAll extends StatefulWidget {
  const EmployeeAll({super.key});

  @override
  State<EmployeeAll> createState() => _EmployeeAllState();
}

class _EmployeeAllState extends State<EmployeeAll> {
  List<EmployeeModel> employeeList = [];
  Future<void> getProducts() async {
    employeeList = await Api_Handler.getAll();
    setState(() {});
  }

  @override
  void initState() {
    getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("All Employees"),
      ),
      body: employeeList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    controller: ScrollController(),
                    shrinkWrap: true,
                    itemCount: employeeList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("${employeeList[index].name}"),
                        subtitle: Text("${employeeList[index].location}"),
                        trailing: Text("${employeeList[index].salary}"),
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
