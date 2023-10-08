import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  double? _deviceHeight, _deviceWidth;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return _buildUi();
  }

  Widget _buildUi() {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: _deviceHeight! * 0.05,
        ),
        child: _gameUi(),
      )),
    );
  }

  Widget _gameUi() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _questionText(),
      ],
    );
  }

  Widget _questionText() {
    return Text("Test Question 1, Nothing Interesting",
        style: TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.w400));
  }
}
