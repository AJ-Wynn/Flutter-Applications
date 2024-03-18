enum Department {groceries,  clothing, electronics}

class Employee {
  final String fullName;
  Department department;
  final String manager;
  final String shift;

  Employee({
    required this.fullName,
    required this.department,
    required this.manager,
    required this.shift,
    });

  String getDepartment() {
    switch (department) {
      case Department.groceries: 
        return 'Groceries';
      case Department.clothing:
        return 'Clothing';
      case Department.electronics:
        return 'Electronics';
    }
  }
}