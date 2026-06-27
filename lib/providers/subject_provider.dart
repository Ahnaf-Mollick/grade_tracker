import 'package:flutter/foundation.dart';
import 'package:grade_tracker/models/subject.dart';

class SubjectProvider extends ChangeNotifier {
  final List<Subject> _subjects = [];

  List<Subject> get subjects => List.unmodifiable(_subjects);

  // Use .where() to filter passing subjects
  List<Subject> get passingSubjects =>
      _subjects.where((s) => s.isPassing).toList();

  // Use .map() to get all grades
  List<String> get allGrades => _subjects.map((s) => s.grade).toList();

  int get totalSubjects => _subjects.length;

  double get averageMark {
    if (_subjects.isEmpty) return 0.0;
    final total = _subjects.fold<int>(0, (sum, s) => sum + s.mark);
    return total / _subjects.length;
  }

  String get overallGrade {
    final avg = averageMark;
    if (_subjects.isEmpty) return '—';
    if (avg >= 80) return 'A';
    if (avg >= 65) return 'B';
    if (avg >= 50) return 'C';
    return 'F';
  }

  void addSubject(Subject subject) {
    _subjects.add(subject);
    notifyListeners();
  }

  void removeSubject(int index) {
    _subjects.removeAt(index);
    notifyListeners();
  }
}
