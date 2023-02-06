import 'package:employee/services/api_handler.dart';
import 'package:flutter/material.dart';

import '../models/employee_model.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_box.dart';

class EmployeeCreate extends StatefulWidget {
  const EmployeeCreate({super.key});

  @override
  State<EmployeeCreate> createState() => _EmployeeCreateState();
}

class _EmployeeCreateState extends State<EmployeeCreate> {
  TextEditingController nameController = TextEditingController();
  TextEditingController eIdController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  double? k = 20;
  late EmployeeModel employee;
  bool isemployee = false;

  Future<void> registerEmp(
    TextEditingController id,
    TextEditingController name,
    TextEditingController salary,
    TextEditingController location,
  ) async {
    employee = await Api_Handler.registerEmployee(
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
        title: const Text("Register Employee"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextBox(
                  title: "E-ID",
                  controller: eIdController,
                  hint: "244Ed21",
                ),
                SizedBox(
                  height: k,
                ),
                CustomTextBox(
                  title: "Name",
                  controller: nameController,
                  hint: "John Doe",
                ),
                SizedBox(
                  height: k,
                ),
                CustomTextBox(
                  title: "Salary",
                  controller: salaryController,
                  hint: "\$200",
                ),
                SizedBox(
                  height: k,
                ),
                CustomTextBox(
                  title: "Location",
                  controller: locationController,
                  hint: "Berlin",
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    final snackbar = SnackBar(
                      content: const Text(
                        "Employee registered Successfully !!!",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      backgroundColor: Colors.grey[900],
                    );
                    registerEmp(
                      eIdController,
                      nameController,
                      salaryController,
                      locationController,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  },
                  child: const Center(
                    child: CustomButton(
                      type: "REGISTER",
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
