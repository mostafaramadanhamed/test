void main() {
StudentInfo s1=StudentInfo(id: 90, name: 'moo', grade: 'grade', age: 17);
s1.printAge();
}
class StudentInfo{
  final int id;
  final String name;
  final String grade;
  final int age;
  StudentInfo({
    required this.id,
    required this.name,
    required this.grade,
    required this.age,
});
  printAge(){
    if(age>18)print(age.toString());
  }
}