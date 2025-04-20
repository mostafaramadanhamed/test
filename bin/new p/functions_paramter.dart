void main(){
  print(greeting('Alice')); // Hello, Alice!
  print(greeting('Bob', title: 'Dr.'));
  print(calculator(10, 5)); // Default: add → 15.0
  print(calculator(10, 5, operation: 'subtract')); // 5.0
  print(calculator(10, 5, operation: 'multiply')); // 50.0
  print(calculator(10, 5, operation: 'divide'));   // 2/
}
String greeting(String name, {String title = ''}) {
  if (title.isEmpty) {
    return 'Hello, $name!';
  } else {
    return 'Hello, $title $name!';
  }
}

double calculator(double a, double b, {String operation = 'add'}) {
  switch (operation) {
    case 'add':
      return a + b;
    case 'subtract':
      return a - b;
    case 'multiply':
      return a * b;
    case 'divide':
      if (b == 0) throw Exception('Cannot divide by zero');
      return a / b;
    default:
      throw Exception('Invalid operation: $operation');
  }
}

