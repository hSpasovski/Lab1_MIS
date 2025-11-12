import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_detail_screen.dart';

class ExamListScreen extends StatelessWidget {
  const ExamListScreen({super.key});

  List<Exam> get exams {
    final now = DateTime.now();
    return [
      Exam(subjectName: "Математика 1", dateTime: now.add(const Duration(days: 2, hours: 3)), rooms: ["А1", "А2"]),
      Exam(subjectName: "Програмирање", dateTime: now.add(const Duration(days: 4)), rooms: ["Лаб 3"]),
      Exam(subjectName: "Компјутерски мрежи", dateTime: now.add(const Duration(days: 10)), rooms: ["А3"]),
      Exam(subjectName: "Бази на податоци", dateTime: now.subtract(const Duration(days: 1)), rooms: ["Б2"], isPassed: true),
      Exam(subjectName: "Оперативни системи", dateTime: now.add(const Duration(days: 6)), rooms: ["А4"]),
      Exam(subjectName: "Мобилни апликации", dateTime: now.add(const Duration(days: 8)), rooms: ["Б1"]),
      Exam(subjectName: "Вештачка интелигенција", dateTime: now.add(const Duration(days: 12)), rooms: ["А5"]),
      Exam(subjectName: "Алгоритми и структури на податоци", dateTime: now.subtract(const Duration(days: 5)), rooms: ["Б3"], isPassed: true),
      Exam(subjectName: "Интернет технологии", dateTime: now.add(const Duration(days: 14)), rooms: ["А6"]),
      Exam(subjectName: "Веб програмирање", dateTime: now.add(const Duration(days: 16)), rooms: ["А7"]),
    ]..sort((a, b) => a.dateTime.compareTo(b.dateTime));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Распоред за испити - 195023"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: exams.length,
              itemBuilder: (ctx, i) {
                return ExamCard(
                  exam: exams[i],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => ExamDetailScreen(exam: exams[i])),
                    );
                  },
                );
              },
            ),
          ),
          Container(
            color: Colors.blueAccent,
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            child: Text(
              "Вкупно испити: ${exams.length}",
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
