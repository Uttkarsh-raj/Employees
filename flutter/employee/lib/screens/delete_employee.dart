import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_box.dart';

class EmployeeDelete extends StatefulWidget {
  const EmployeeDelete({super.key});

  @override
  State<EmployeeDelete> createState() => _EmployeeDeleteState();
}

class _EmployeeDeleteState extends State<EmployeeDelete> {
  TextEditingController eIdController = TextEditingController();
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
              const Center(
                child: CustomButton(
                  type: "DELETE",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
