import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibmi/widgets/info_card.dart';

class BMIPage extends StatefulWidget {
  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  double? _deviceHeight, _deviceWidth;

  int _age = 25, _weight = 160, _height = 70, _gender = 0;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
        child: Container(
            height: _deviceHeight! * 0.85,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [_ageSelectContainer(), _weightSelectContainer()],
                ),
                _heightSelectContainer(),
                _genderSelectContainer(),
              ],
            )));
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
          Text(
            _age.toString(),
            style: const TextStyle(
                color: Colors.white, fontSize: 45, fontWeight: FontWeight.w700),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 50,
                child: CupertinoDialogAction(
                  onPressed: () {
                    setState(() {
                      _age--;
                    });
                  },
                  textStyle: const TextStyle(fontSize: 25, color: Colors.red),
                  child: const Text("-"),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              SizedBox(
                width: 50,
                child: CupertinoDialogAction(
                  onPressed: () {
                    setState(() {
                      _age++;
                    });
                  },
                  textStyle: const TextStyle(fontSize: 25, color: Colors.blue),
                  child: const Text("+"),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _weightSelectContainer() {
    return InfoCard(
      width: _deviceWidth! * 0.45,
      height: _deviceHeight! * 0.20,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Weight Ibs",
            style: TextStyle(
                color: Colors.white, fontSize: 21, fontWeight: FontWeight.w400),
          ),
          Text(
            _weight.toString(),
            style: const TextStyle(
                color: Colors.white, fontSize: 45, fontWeight: FontWeight.w700),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 50,
                child: CupertinoDialogAction(
                  onPressed: () {
                    setState(() {
                      _weight--;
                    });
                  },
                  textStyle: const TextStyle(fontSize: 25, color: Colors.red),
                  child: const Text("-"),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              SizedBox(
                width: 50,
                child: CupertinoDialogAction(
                  onPressed: () {
                    setState(() {
                      _weight++;
                    });
                  },
                  textStyle: const TextStyle(fontSize: 25, color: Colors.blue),
                  child: const Text("+"),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _heightSelectContainer() {
    return InfoCard(
      width: _deviceWidth! * 0.90,
      height: _deviceHeight! * 0.15,
      child: Column(children: [
        const Text(
          "Height in",
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        Text(
          _height.toString(),
          style: const TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: _deviceWidth! * 0.8,
          child: CupertinoSlider(
              min: 0,
              max: 96,
              value: _height.toDouble(),
              divisions: 96,
              onChanged: (value) {
                setState(() {
                  _height = value.toInt();
                });
              }),
        ),
      ]),
    );
  }

  Widget _genderSelectContainer() {
    return InfoCard(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Gender",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white)),
          CupertinoSlidingSegmentedControl(
              groupValue: _gender,
              children: const {
                0: Text(
                  "Male",
                  style: TextStyle(color: Colors.white),
                ),
                1: Text(
                  "Female",
                  style: TextStyle(color: Colors.white),
                ),
              },
              onValueChanged: (value) {
                setState(() {
                  _gender = value as int;
                });
              })
        ],
      ),
      width: _deviceWidth! * 0.9,
      height: _deviceHeight! * 0.11,
    );
  }
}
