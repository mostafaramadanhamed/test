void main(){
  Map<int, String> students = {};

  // Set of student IDs who are present
  Set<int> attendance = {};

  // Add students
  addStudent(students, 1, "Alice");
  addStudent(students, 2, "Bob");
  addStudent(students, 3, "Charlie");

  // Mark attendance
  markPresent(attendance, 1);
  markPresent(attendance, 3);

  // Display attendance
  displayAttendance(students, attendance);
}

// Function to add student
void addStudent(Map<int, String> students, int id, String name) {
  students[id] = name;
  print("Student added: $name (ID: $id)");
}

// Function to mark a student as present
void markPresent(Set<int> attendance, int id) {
  attendance.add(id);
  print("Student ID $id marked as present");
}

// Function to display attendance
void displayAttendance(Map<int, String> students, Set<int> attendance) {
  print("\n--- Attendance Report ---");
  students.forEach((id, name) {
    String status = attendance.contains(id) ? "Present" : "Absent";
    print("$name (ID: $id): $status");
  });
}
