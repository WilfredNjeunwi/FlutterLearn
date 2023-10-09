import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class GamePageProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  final int _maxQuestions = 10;
  List? questions;
  int _currentQuestionCount = 0;
  BuildContext context;
  GamePageProvider({required this.context}) {
    _dio.options.baseUrl = 'https://opentdb.com/api.php';
    _getQuestionsFromAPI();
  }

  Future<void> _getQuestionsFromAPI() async {
    var _response = await _dio.get('', queryParameters: {
      'amount': 10,
      'type': 'boolean',
      'difficulty': "easy",
    });

    var _data = jsonDecode(_response.toString());
    questions = _data['results'];
    notifyListeners();
  }

  String getCurrentQuestionText() {
    return questions![_currentQuestionCount]["question"];
  }

  void answerQuestion(String _answer) {
    bool isCorrect =
        questions![_currentQuestionCount]["correct_answer"] == _answer;

    _currentQuestionCount++;
    print(questions![_currentQuestionCount]["correct_answer"]);
    log(isCorrect ? "Correct" : "Incorrect");
    notifyListeners();
  }
}