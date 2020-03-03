//imports
import 'dart:async';
import './employee.dart';

 
class EmployeeBloc{

  //list of employee
  List<Employee> _employeeList=[
    Employee(1, 'Manish', 25000.0),
    Employee(2, 'Rohan', 35000.0),
    Employee(3, 'Kashu', 45000.0),
    Employee(4, 'Rohit', 55000.0),
    Employee(5, 'Nitin', 65000.0),


  ];

  //stream controllers

  final _employeeListStreamController =StreamController<List<Employee>>();
  final _employeeSalaryIncrementStreamController =StreamController<Employee>();
  final _employeeSalaryDecrementStreamController =StreamController<Employee>();
 
  //getters
  
  Stream<List<Employee>> get employeeListStream =>
    _employeeListStreamController.stream;

  StreamSink<List<Employee>> get employeeListSink =>
    _employeeListStreamController.sink;
  
  StreamSink<Employee> get  employeeSalaryIncrement =>
    _employeeSalaryIncrementStreamController.sink;

  StreamSink<Employee> get  employeeSalaryDecrement =>
    _employeeSalaryDecrementStreamController.sink;
  

  //create constructor - add data,listen to changes
  EmployeeBloc(){
    _employeeListStreamController.add(_employeeList);
    _employeeSalaryIncrementStreamController.stream.listen(_incrementSalary);
    _employeeSalaryDecrementStreamController.stream.listen(_decrementSalary);

  }

  void _incrementSalary(Employee employee){
    double salary=employee.salary;
    double incrementSalary=salary * 20/100;
    _employeeList[employee.id-1].salary=salary+incrementSalary;
    employeeListSink.add(_employeeList);
  }

  void _decrementSalary(Employee employee){
    double salary=employee.salary;
    double decrementSalary=salary * 20/100;
    _employeeList[employee.id-1].salary=salary-decrementSalary;
    employeeListSink.add(_employeeList);
  }

  void dispose(){
    _employeeSalaryIncrementStreamController.close();
    _employeeSalaryDecrementStreamController.close();
    _employeeListStreamController.close();
  }
}
  
  

