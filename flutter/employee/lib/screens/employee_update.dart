import 'package:flutter/material.dart';

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
      body: Center(
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
              const Center(
                child: CustomButton(
                  type: "UPDATE",
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
    );
  }
}
