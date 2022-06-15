import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questionList;
  final int questionIndex;
  final VoidCallback answerQuestion;

  Quiz(
      {@required this.questionList,
      @required this.answerQuestion,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(questionList[questionIndex]['questionText']),
      ...(questionList[questionIndex]['answer'] as List<String>).map((answer) {
        return Answer(answerQuestion, answer);
      }).toList()
    ]);
  }
}
