import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

//`_` makes MyAppState from public to private class
class _MyAppState extends State<MyApp> {
  final _questionList = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'White', 'score': 20},
        {'text': 'Read', 'score': 5},
        {'text': 'Green', 'score': 2},
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Dog', 'score': 10},
        {'text': 'Rabbit', 'score': 2},
        {'text': 'Cat', 'score': 5},
        {'text': 'Lion', 'score': 20},
      ]
    },
    {
      'questionText': 'Who\'s your favorite actor?',
      'answers': [
        {'text': 'Batman', 'score': 10},
        {'text': 'Ironman', 'score': 20},
        {'text': 'Superman', 'score': 5},
        {'text': 'Spiderman', 'score': 2},
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Quizzi App")),
        body: _questionIndex < _questionList.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questionList: _questionList)
            : Result(_totalScore),
      ),
    );
  }
}
