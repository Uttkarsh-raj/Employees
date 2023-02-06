class EmployeeModel {
  String? id;
  String? name;
  String? salary;
  String? location;

  EmployeeModel({this.id, this.name, this.salary, this.location});

  EmployeeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    salary = json['salary'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['salary'] = this.salary;
    data['location'] = this.location;
    return data;
  }

  static List<EmployeeModel> employeeFromSnapshot(List employeeSnapshot) {
    return employeeSnapshot.map((data) {
      return EmployeeModel.fromJson(data);
    }).toList();
  }
}
