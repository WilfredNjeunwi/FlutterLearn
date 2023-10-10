import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibmi/widgets/info_card.dart';

class BMIPage extends StatefulWidget {
  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  double? _deviceHeight, _deviceWidth;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
        child: Container(
      child: Center(
        child: _ageSelectContainer(),
      ),
    ));
  }

  Widget _ageSelectContainer() {
    return InfoCard(
      width: _deviceWidth! * 0.45,
      height: _deviceHeight! * 0.20,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Age yr",
            style: TextStyle(
                color: Colors.white, fontSize: 21, fontWeight: FontWeight.w400),
          ),
          const Text(
            "34",
            style: TextStyle(
                color: Colors.white, fontSize: 45, fontWeight: FontWeight.w700),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [],
          )
        ],
      ),
    );
  }
}
