import 'dart:async';
class DataBox<T> {
  T value;
  DataBox(this.value);

  void display() {
    print('Stored Value: $value');
  }
}
class StudentNotFoundException implements Exception {
  final String message;
  StudentNotFoundException(this.message);

  @override
  String toString() => 'Error: $message';
}
class Student {
  String name;
  int rollNo;
  Map<String, double> subjects;

  Student(this.name, this.rollNo, this.subjects);

  void showDetails() {
    print('\nStudent: $name | Roll No: $rollNo');
    print('Subjects & Marks:');
    subjects.forEach((subject, marks) {
      print('  $subject : $marks');
    });
  }
}
Future<String> calculateGrade(Map<String, double> subjects) async {
  await Future.delayed(Duration(seconds: 1));
  double total = subjects.values.reduce((a, b) => a + b);
  double avg = total / subjects.length;

  if (avg >= 90) return "A+";
  if (avg >= 75) return "A";
  if (avg >= 60) return "B";
  if (avg >= 45) return "C";
  return "Fail";
}

/// Main Function
void main() async {
  try {
    var studentBox = DataBox<Student>(
      Student("Niharika", 101, {"Math": 92, "Science": 88, "English": 85}),
    );

    studentBox.display();
    studentBox.value.showDetails();

    String grade = await calculateGrade(studentBox.value.subjects);
    print("\nCalculated Grade: $grade");

    throw StudentNotFoundException("Student record not found in the database!");

  } catch (e) {
    print("\n$e");
  } finally {
    print("\n Process completed successfully!");
  }
}
