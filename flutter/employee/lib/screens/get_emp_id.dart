import 'dart:ffi';

import 'package:employee/models/employee_model.dart';
import 'package:employee/services/api_handler.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_box.dart';

class EmployeeById extends StatefulWidget {
  const EmployeeById({super.key});

  @override
  State<EmployeeById> createState() => _EmployeeByIdState();
}

class _EmployeeByIdState extends State<EmployeeById> {
  TextEditingController eIdController = TextEditingController();
  bool isemployee = false;
  late EmployeeModel employee;
  Future<void> getEmployee(TextEditingController text) async {
    employee = await Api_Handler.getEmployee(id: text.text);
    setState(() {
      isemployee = true;
    });
  }

  @override
  void dispose() {
    eIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double? k = 20;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Get Employee data"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextBox(
                title: "E-ID",
                controller: eIdController,
                hint: "124FR34",
              ),
              SizedBox(
                height: k,
              ),
              GestureDetector(
                onTap: () async {
                  await getEmployee(eIdController);
                },
                child: const Center(
                  child: CustomButton(
                    type: "Get Empl.",
                  ),
                ),
              ),
              SizedBox(height: k),
              if (isemployee == true)
                ListTile(
                  title: Text("${employee.name}"),
                  subtitle: Text("${employee.location}"),
                  trailing: Text("${employee.salary}"),
                )
            ],
          ),
        ),
      ),
    );
  }
}
