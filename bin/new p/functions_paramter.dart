void main(){
  print(greeting('Alice')); // Hello, Alice!
  print(greeting('Bob', title: 'Dr.')); //
}
String greeting(String name, {String title = ''}) {
  if (title.isEmpty) {
    return 'Hello, $name!';
  } else {
    return 'Hello, $title $name!';
  }
}

