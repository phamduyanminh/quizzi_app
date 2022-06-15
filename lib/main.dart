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
      'questionText': 'What\'s my favorite color?',
      'answer': ['Black', 'White', 'Read', 'Green']
    },
    {
      'questionText': 'What\'s my name?',
      'answer': ['Dog', 'Rabbit', 'Cat', 'Lion']
    },
    {
      'questionText': 'Who\'s my favorite actor?',
      'answer': ['Max', 'Mike', 'Miller', 'Moose']
    },
  ];

  var _questionIndex = 0;

  void _answerQuestion() {
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
            : Result(),
      ),
    );
  }
}
