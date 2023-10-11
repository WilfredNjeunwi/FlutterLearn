import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';

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
        child: Center(
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
              _calculateBMIButton(),
            ],
          )),
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
      width: _deviceWidth! * 0.9,
      height: _deviceHeight! * 0.11,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Gender",
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
    );
  }

  Widget _calculateBMIButton() {
    return Container(
      height: _deviceHeight! * .07,
      child: CupertinoButton(
          color: Colors.blue,
          child: const Text(
            "Calculate BMI",
            //style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            if (_height > 0 && _weight > 0 && _age > 0) {
              double _bmi = (_weight / pow(_height, 2)) * 783;
              _showResultDialog(_bmi);
            }
          }),
    );
  }

  void _showResultDialog(double bmi) {
    String? status;
    if (bmi < 18.5) {
      status = "UnderWeight";
    } else if (bmi >= 18.5 && bmi < 25) {
      status = "Normal";
    } else if (bmi >= 25 && bmi < 38) {
      status = "Overweight";
    } else {
      status = "Obese";
    }
    showCupertinoDialog(
        context: context,
        builder: (BuildContext _context) {
          return CupertinoAlertDialog(
            title: Text(status!),
            content: Text(bmi.toStringAsFixed(2)),
            actions: [
              CupertinoDialogAction(
                child: const Text("Ok"),
                onPressed: () {
                  _saveResult(bmi.toString(), status!);
                  Navigator.pop(_context);
                },
              )
            ],
          );
        });
  }

  void _saveResult(String bmi, String status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('bmi_date', DateTime.now().toString());
    await prefs.setStringList("bmi_data", <String>[bmi, status]);
    print(" BMI Result Saved!");
  }
}
