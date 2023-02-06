import 'package:flutter/material.dart';

import '../models/employee_model.dart';
import '../services/api_handler.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_box.dart';

class EmployeeDelete extends StatefulWidget {
  const EmployeeDelete({super.key});

  @override
  State<EmployeeDelete> createState() => _EmployeeDeleteState();
}

class _EmployeeDeleteState extends State<EmployeeDelete> {
  TextEditingController eIdController = TextEditingController();
  late EmployeeModel employee;

  Future<void> deleteEmployee(
    TextEditingController id,
  ) async {
    employee = await Api_Handler.deleteEmployee(id: id.text.trim());
    setState(() {});
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
        title: const Text("Delete data"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextBox(
                title: "E-ID",
                controller: eIdController,
              ),
              SizedBox(
                height: k,
              ),
              GestureDetector(
                onTap: () {
                  deleteEmployee(eIdController);
                  final snackbar = SnackBar(
                    content: const Text(
                      "Employee deleted Successfully !!!",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    backgroundColor: Colors.grey[900],
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                },
                child: const Center(
                  child: CustomButton(
                    type: "DELETE",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// deleteEmployee(eIdController);
                  // final snackbar = SnackBar(
                  //   content: const Text(
                  //     "Employee deleted Successfully !!!",
                  //     style: TextStyle(color: Colors.white, fontSize: 15),
                  //   ),
                  //   backgroundColor: Colors.grey[900],
                  // );
                  // if (isemployee == true) {
                  //   ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  // }