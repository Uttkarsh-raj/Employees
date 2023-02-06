import 'package:employee/services/api_handler.dart';
import 'package:flutter/material.dart';

import '../models/employee_model.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_box.dart';

class EmployeeUpdate extends StatefulWidget {
  const EmployeeUpdate({super.key});

  @override
  State<EmployeeUpdate> createState() => _EmployeeUpdateState();
}

class _EmployeeUpdateState extends State<EmployeeUpdate> {
  TextEditingController nameController = TextEditingController();
  TextEditingController eIdController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  double? k = 20;
  late EmployeeModel employee;
  bool isemployee = false;

  Future<void> employeeUpdate(
    TextEditingController id,
    TextEditingController name,
    TextEditingController salary,
    TextEditingController location,
  ) async {
    employee = await Api_Handler.updateEmployee(
      id: id.text.trim(),
      name: name.text.trim(),
      location: location.text.trim(),
      salary: salary.text.trim(),
    );
    setState(() {
      isemployee = true;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    eIdController.dispose();
    locationController.dispose();
    salaryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Update Data"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextBox(
                  title: "Name",
                  controller: nameController,
                ),
                SizedBox(
                  height: k,
                ),
                CustomTextBox(
                  title: "E-ID",
                  controller: eIdController,
                ),
                SizedBox(
                  height: k,
                ),
                CustomTextBox(
                  title: "Salary",
                  controller: salaryController,
                ),
                SizedBox(
                  height: k,
                ),
                CustomTextBox(
                  title: "Location",
                  controller: locationController,
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    employeeUpdate(
                      eIdController,
                      nameController,
                      locationController,
                      salaryController,
                    );
                    final snackbar = SnackBar(
                      content: const Text(
                        "Employee updated Successfully !!!",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      backgroundColor: Colors.grey[900],
                    );
                    if (isemployee == true) {
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    }
                  },
                  child: const Center(
                    child: CustomButton(
                      type: "UPDATE",
                    ),
                  ),
                ),
                SizedBox(
                  height: k,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "ℹ️ The employee must be already registered.",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
                SizedBox(
                  height: k,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
