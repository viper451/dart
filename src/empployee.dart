import 'dart:io';

class Employee {
  late int id;
  late String fname;
  late String lname;
  late int age;
  late int salary;

  Employee({
    required this.id,
    required this.fname,
    required this.lname,
    required this.age,
    required this.salary,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'fname': fname,
        'lname': lname,
        'age': age,
        'salary': salary,
      };
}

class Company {
  late List<Employee> _employees;

  Company() {
    _employees = <Employee>[];
  }

  bool createEmployee(String fname, String lname, int age, int salary) {
    try {
      _employees.add(
        Employee(
          fname: fname,
          lname: lname,
          age: age,
          salary: salary,
          id: _employees.length,
        ),
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Map<String, dynamic> getEmployee(int index) {
    return _employees[index].toJson();
  }

  bool deleteEmployee(int index) {
    try {
      _employees.removeAt(index);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool updateEmployee(int index, int salary) {
    try {
      Employee k = _employees[index];
      k.salary = salary;
      return true;
    } catch (e) {
      return false;
    }
  }
}

class CompanyV2 {
  late Map<int, Employee> _employees;
  late int count;

  CompanyV2() {
    _employees = <int, Employee>{};
    count = 0;
  }

  int? createEmployee(String fname, String lname, int age, int salary) {
    try {
      _employees[count] = Employee(
        fname: fname,
        lname: lname,
        age: age,
        salary: salary,
        id: _employees.length,
      );
      count++;
      return count - 1;
    } catch (e) {
      return null;
    }
  }

  Map<String, dynamic>? getEmployee(int index) {
    Employee? k = _employees[index];
    if (k == null) {
      return null;
    } else {
      return k.toJson();
    }
  }

  bool deleteEmployee(int index) {
    try {
      Employee? k = _employees.remove(index);
      if (k != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  bool updateEmployee(int index, int salary) {
    try {
      Employee? k = (_employees[index]);
      if (k != null) {
        k.salary = salary;
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}

void main() {
  CompanyV2 company = CompanyV2();
  int choice = 1;
  while (choice != 0) {
    print("---Company---");
    print("1. Add employee");
    print("2. remove Employee");
    print("3. update employee");
    print("4. get employee");
    print("Enter your choice: ");
    choice = int.parse(stdin.readLineSync()!);
    switch (choice) {
      case 1:
        print("Enter the employee details: ");
        print("Enter the first name: ");
        String fname = stdin.readLineSync()!;
        print("Enter the last name: ");
        String lname = stdin.readLineSync()!;
        print("Enter the age: ");
        int age = int.parse(stdin.readLineSync()!);
        print("Enter the salary: ");
        int salary = int.parse(stdin.readLineSync()!);
        int? id = company.createEmployee(fname, lname, age, salary);
        if (id != null) {
          print("Employee added successfully");
          print("Your id is: $id");
        } else {
          print("Employee not added");
        }
        break;
      case 2:
        print("Enter the employee id: ");
        int id = int.parse(stdin.readLineSync()!);
        if (company.deleteEmployee(id)) {
          print("Employee deleted successfully");
        } else {
          print("Employee not deleted");
        }
        break;
      case 3:
        print("Enter the employee id: ");
        int id = int.parse(stdin.readLineSync()!);
        print("Enter the salary: ");
        int salary = int.parse(stdin.readLineSync()!);
        if (company.updateEmployee(id, salary)) {
          print("Employee added successfully");
        } else {
          print("Employee not added");
        }
        break;
      case 4:
        print("Enter the employee id: ");
        int id = int.parse(stdin.readLineSync()!);
        Map<String, dynamic>? employee = company.getEmployee(id);
        if (employee != null) {
          print("Employee details: ");
          print("First name: ${employee['fname']}");
          print("Last name: ${employee['lname']}");
          print("Age: ${employee['age']}");
          print("Salary: ${employee['salary']}");
          print(employee);
        } else {
          print("Employee not found");
        }
        break;
      case 0:
        print("Exiting...");
        break;
      default:
        print("Invalid choice");
    }
  }
}
