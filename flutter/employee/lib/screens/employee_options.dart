import 'package:employee/screens/delete_employee.dart';
import 'package:employee/screens/employee_create.dart';
import 'package:employee/screens/employee_update.dart';
import 'package:employee/screens/get_emp_id.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import 'get_all_employee.dart';

class EmployeeOptions extends StatefulWidget {
  const EmployeeOptions({super.key});

  @override
  State<EmployeeOptions> createState() => _EmployeeOptionsState();
}

class _EmployeeOptionsState extends State<EmployeeOptions> {
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
        title: const Text("Employee"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const EmployeeAll(),
                    ),
                  );
                },
                child: const Center(
                  child: CustomButton(
                    type: "All Empls.",
                  ),
                ),
              ),
              SizedBox(
                height: k,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const EmployeeById(),
                    ),
                  );
                },
                child: const Center(
                  child: CustomButton(
                    type: "Employee-ID",
                  ),
                ),
              ),
              SizedBox(
                height: k,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const EmployeeCreate(),
                    ),
                  );
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
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const EmployeeUpdate(),
                    ),
                  );
                },
                child: const Center(
                  child: CustomButton(
                    type: "Update",
                  ),
                ),
              ),
              SizedBox(
                height: k,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const EmployeeDelete(),
                    ),
                  );
                },
                child: const Center(
                  child: CustomButton(
                    type: "Delete",
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
