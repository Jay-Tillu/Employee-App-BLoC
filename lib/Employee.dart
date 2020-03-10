class Employee {
  int _id;
  String _name;
  double _salary;

  Employee(this._id, this._salary, this._name);

  // Setters
  set employeeID(int id) {
    this._id = id;
  }

  set employeeSalary(double salary) {
    this._salary = salary;
  }

  set employeeName(String name) {
    this._name = name;
  }

  // Getters
  int get employeeID => this._id;

  double get employeeSalary => this._salary;

  String get employeeName => this._name;
}
