import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibmi/widgets/info_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryPage extends StatelessWidget {
  double? _deviceHeight, _deviceWidth;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return CupertinoPageScaffold(
      child: _dataCard(),
    );
  }

  Widget _dataCard() {
    return FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (BuildContext _contex, AsyncSnapshot _snapshot) {
          if (_snapshot.hasData) {
            final _prefs = _snapshot.data as SharedPreferences;
            final _date = _prefs.getString("bmi_date");
            final _data = _prefs.getStringList('bmi_data');
            return Center(
              child: InfoCard(
                width: _deviceWidth! * 0.75,
                height: _deviceHeight! * 0.25,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _statusText(_data![1]),
                    _dateText(_date!),
                    _bmiText(_data[0])
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: CupertinoActivityIndicator(
                color: Colors.blue,
              ),
            );
          }
        });
  }

  Widget _statusText(String status) {
    return Text(status,
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.w400, color: Colors.white));
  }

  Widget _dateText(String date) {
    DateTime parseDate = DateTime.parse(date);

    return Text('${parseDate.day}/${parseDate.month}/${parseDate.year}',
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w300, color: Colors.white));
  }

  Widget _bmiText(String bmi) {
    double parsebmi = double.parse(bmi);
    return Text(parsebmi.toStringAsFixed(2),
        style: TextStyle(
            fontSize: 60, fontWeight: FontWeight.w600, color: Colors.white));
  }
}
