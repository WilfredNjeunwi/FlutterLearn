import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class GamePageProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  final int _maxQuestions = 10;
  List? questions;
  int _currentQuestionCount = 0;
  int _score = 0;
  double level = 0;
  BuildContext context;
  GamePageProvider({required this.context}) {
    _dio.options.baseUrl = 'https://opentdb.com/api.php';
    _getQuestionsFromAPI();
  }

  Future<void> _getQuestionsFromAPI() async {
    var response = await _dio.get('', queryParameters: {
      'amount': _maxQuestions,
      'type': 'boolean',
      'difficulty': level == 0
          ? "easy"
          : level == 1
              ? "medium"
              : "difficult",
    });

    var data = jsonDecode(response.toString());
    questions = data['results'];
    notifyListeners();
  }

  String getCurrentQuestionText() {
    return questions![_currentQuestionCount]["question"];
  }

  void answerQuestion(String answer) async {
    bool isCorrect =
        questions![_currentQuestionCount]["correct_answer"] == answer;
    isCorrect ? _score++ : null;
    _currentQuestionCount++;
    showDialog(
        context: context,
        builder: (BuildContext _copntext) {
          return AlertDialog(
            backgroundColor: isCorrect ? Colors.green : Colors.red,
            title: Icon(
              isCorrect ? Icons.check_circle : Icons.cancel_sharp,
              color: Colors.white,
            ),
          );
        });
    await Future.delayed(const Duration(seconds: 1));

    Navigator.pop(context);

    if (_currentQuestionCount == _maxQuestions) {
      endGame();
    } else {
      notifyListeners();
    }
  }

  Future<void> endGame() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: _score >= 5 ? Colors.green : Colors.red,
            title: const Text("End Game!",
                style: TextStyle(fontSize: 25, color: Colors.white)),
            content: Text("Score: $_score/10"),
          );
        });

    await Future.delayed(const Duration(seconds: 3));
    Navigator.pop(context);
    Navigator.pop(context);
  }

  void changeLevel(double lev) {
    level = lev;
    notifyListeners();
  }
}
