import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';


class Quiz extends StatelessWidget {
  final Function answerQuestion;
  final int questionIndex;
  final List<Map<String, Object>>? questions;

  Quiz({required this.answerQuestion, required this.questions, required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions?[questionIndex]['questionText'] as String,
        ),
        ...(questions?[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text'] as String);
        }).toList()
      ],
      );
  }
}