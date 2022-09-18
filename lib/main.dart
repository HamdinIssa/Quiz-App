import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

bool isSwitched = false;

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _totalScore = 0;

  answerQuestion(int score) {
    setState(() {
      _questionIndex += 1;
      _totalScore += score;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  final List<Map<String, Object>> _questions = [
    {
      'questionText':
          'What is a sequence of instructions which enables a computer to perform a desired task?',
      'answers': [
        {'text': 'program', 'score': 1},
        {'text': 'compiler', 'score': 0},
        {'text': 'assembly', 'score': 0},
        {'text': 'algorithm', 'score': 0},
      ]
    },
    {
      'questionText':
          '_____ is a set of commands or instructions which directs a computer in doing a task.',
      'answers': [
        {'text': 'Program', 'score': 1},
        {'text': 'Programmer', 'score': 0},
        {'text': 'Language', 'score': 0},
        {'text': 'Programming Language', 'score': 0},
      ]
    },
    {
      'questionText': 'Human communicates with computer using _____ language.',
      'answers': [
        {'text': 'sign', 'score': 0},
        {'text': 'English', 'score': 0},
        {'text': 'Machine', 'score': 0},
        {'text': 'Programming', 'score': 1},
      ]
    },
    {
      'questionText':
          'What is a list of steps that you can follow to finish a task?',
      'answers': [
        {'text': 'commands', 'score': 0},
        {'text': 'wires', 'score': 0},
        {'text': 'algorithm', 'score': 1},
        {'text': 'program', 'score': 0},
      ]
    },
    {
      'questionText':
          'Which of the following would be a conditional operation? ',
      'answers': [
        {'text': 'Wet hair', 'score': 0},
        {'text': 'Turn left', 'score': 0},
        {'text': 'Rinse', 'score': 0},
        {'text': 'Add soap until suds appear', 'score': 1},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Quiz App',
            style: TextStyle(
                color:  Colors.white),
          ),
          actions: [
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
              activeColor: Colors.black,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.white,
            ),
          ],
        ),
        body: Container(
          color: isSwitched == false ? Colors.white : Colors.black,
          child: _questionIndex < _questions.length
              ? Quiz(_questions, _questionIndex, answerQuestion)
              : Result(_resetQuiz, _totalScore),
        ),
      ),
    );
  }
}
