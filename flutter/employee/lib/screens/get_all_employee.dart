import 'package:flutter/material.dart';

class EmployeeAll extends StatefulWidget {
  const EmployeeAll({super.key});

  @override
  State<EmployeeAll> createState() => _EmployeeAllState();
}

class _EmployeeAllState extends State<EmployeeAll> {
  TextEditingController eIdController = TextEditingController();
  @override
  void dispose() {
    eIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("All Employees"),
      ),
    );
  }
}
