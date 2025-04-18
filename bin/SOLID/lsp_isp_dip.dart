void main() {
  Employee emp = Senior('Alice', 160);
  var calculator = FullTimeCalculator();
  var reportGen = SimpleReportGenerator();
  var saver = ConsoleSaver();

  var service = EmployeeService(
    calculator: calculator,
    reportGenerator: reportGen,
    saver: saver,
  );

  service.process(emp);
}

// SRP: Single Responsibility Principle
class Employee {
  final String name;
  final String role;
  final double hoursWorked;

  Employee(this.name, this.role, this.hoursWorked);
}

// SRP, OCP, DIP
// SRP: Defines one responsibility (salary calculation)
// OCP: Open for extension via subclasses
// DIP: High-level code depends on abstraction
abstract class SalaryCalculator {
  double calculateSalary(Employee employee);
}

// SRP, OCP, DIP
abstract class ReportGenerator {
  String generateReport(String employeeName);
}

// SRP, OCP, DIP
abstract class SaverEmployee {
  void save(Employee employee);
}

// OCP, LSP
// OCP: New behavior via subclassing
// LSP: Can replace base class without breaking functionality
class FullTimeCalculator extends SalaryCalculator {
  @override
  double calculateSalary(Employee employee) {
    return (employee.hoursWorked * 20) + 2000;
  }
}

// OCP, LSP
class PartTimeCalculator extends SalaryCalculator {
  @override
  double calculateSalary(Employee employee) {
    return employee.hoursWorked * 10;
  }
}

// LSP: Subtypes can be used as instances of the parent class
class Senior extends Employee {
  Senior(String name, double hoursWorked) : super(name, 'Senior', hoursWorked);
}

// LSP
class Junior extends Employee {
  Junior(String name, double hoursWorked) : super(name, 'Junior', hoursWorked);
}

// OCP, LSP
class SimpleReportGenerator extends ReportGenerator {
  @override
  String generateReport(String employeeName) {
    return 'Performance Report for $employeeName';
  }
}

// OCP, LSP
class ConsoleSaver extends SaverEmployee {
  @override
  void save(Employee employee) {
    print('Saving employee: ${employee.name}, Role: ${employee.role}');
  }
}

// DIP, SRP
// DIP: Depends on abstractions (not concrete implementations)
// SRP: Handles one responsibility — orchestrating employee-related operations
class EmployeeService {
  final SalaryCalculator calculator;
  final ReportGenerator reportGenerator;
  final SaverEmployee saver;

  EmployeeService({
    required this.calculator,
    required this.reportGenerator,
    required this.saver,
  });

  void process(Employee employee) {
    final salary = calculator.calculateSalary(employee);
    final report = reportGenerator.generateReport(employee.name);

    print('Salary: \$$salary');
    print(report);

    saver.save(employee);
  }
}
