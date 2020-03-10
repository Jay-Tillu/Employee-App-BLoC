//TODO: Do your imports
//TODO: Create list of Employees
//TODO: Define all of your stream controllers
//TODO: Stream Sink getters
//TODO: Create constructor to add data and listen to changes
//TODO: core functions
//TODO: Close all your stream controllers (dispose)

// Sink is used to add data in data flow
// Stream is used to get data from data flow

// imports
import 'dart:async';
import 'Employee.dart';

class EmployeeBloc {
// ************  Create List of Employees  *******************
  List<Employee> _employeeList = [
    Employee(1, 10000.0, "Employee one"),
    Employee(2, 20000.0, "Employee two"),
    Employee(3, 30000.0, "Employee three"),
    Employee(4, 40000.0, "Employee four"),
    Employee(5, 50000.0, "Employee five")
  ];

// ****************  Stream Controllers  ***********************

// StreamControllers are handling input and output.

  // StreamController for employee list
  final _employeeListStreamController = StreamController<List<Employee>>();

  // StreamController for increment and decrement
  final _employeeSalaryIncrementStreamController = StreamController<Employee>();
  final _employeeSalaryDecrementStreamController = StreamController<Employee>();

// **********************  Getters  *****************************
  // Because we need getter for both input and output, on Employee List
  // we create stream and sink together for Employee List.

  Stream<List<Employee>> get employeeListStream =>
      _employeeListStreamController.stream;

  StreamSink<List<Employee>> get employeeListSink =>
      _employeeListStreamController.sink;

  // Because increment and decrement both need only input we only use sink.
  StreamSink<Employee> get employeeSalaryIncrementSink =>
      _employeeSalaryIncrementStreamController.sink;

  StreamSink<Employee> get employeeSalaryDecrementSink =>
      _employeeSalaryDecrementStreamController.sink;

// *****************  Constructor to add data and listen to changes  ***************

  EmployeeBloc() {
    // add employee list to stream
    _employeeListStreamController.add(_employeeList);

    // listen changes on increment and decrement
    _employeeSalaryIncrementStreamController.stream.listen(_incrementSalary);
    _employeeSalaryDecrementStreamController.stream.listen(_decrementSalary);
  }

// *****************  Core Functions  *************************
  _incrementSalary(Employee employee) {
    double salary = employee.employeeSalary;
    double incrementedSalary = salary * 20 / 100;
    _employeeList[employee.employeeID - 1].employeeSalary = salary + incrementedSalary;
    employeeListSink.add(_employeeList);
  }

  _decrementSalary(Employee employee) {
    double salary = employee.employeeSalary;
    double decrementedSalary = salary * 20 / 100;
    _employeeList[employee.employeeID - 1].employeeSalary = salary - decrementedSalary;
    employeeListSink.add(_employeeList);
  }

// **************  Close the StreamControllers  ****************

  void dispose() {
    _employeeSalaryDecrementStreamController.close();
    _employeeSalaryIncrementStreamController.close();
    _employeeListStreamController.close();
  }
}
