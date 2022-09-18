// Packages
import 'package:flutter/material.dart';

// Widgets
import '../widgets/answer.dart';
import '../widgets/question.dart';

class Quiz extends StatelessWidget {
  const Quiz(
    this.questions,
    this.questionIndex,
    this.answerQuestion, {
    Key? key,
  }) : super(key: key);

  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function(int s) answerQuestion;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Question(questions[questionIndex]['questionText'].toString()),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              () => answerQuestion(int.parse(answer['score'].toString())),
              answer['text'].toString());
        }).toList(),
      ],
    );
  }
}
