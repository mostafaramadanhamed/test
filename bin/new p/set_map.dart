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

  String text = "hello world hello dart world hello";

  Map<String, int> wordCount = countWordFrequency(text);

  print("Word Frequencies:");
  wordCount.forEach((word, count) {
    print("$word: $count");
  });
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

Map<String, int> countWordFrequency(String text) {
  // Split by whitespace and remove empty entries
  List<String> words = text.toLowerCase().split(RegExp(r'\s+'));

  Map<String, int> frequencyMap = {};

  for (var word in words) {
    frequencyMap[word] = (frequencyMap[word] ?? 0) + 1;
  }

  return frequencyMap;
}