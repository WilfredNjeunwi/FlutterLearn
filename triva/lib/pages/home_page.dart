import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:triva/pages/game_page.dart';
import 'package:triva/provider/game_page_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? _deviceWidth;
  double? _deviceHeight;
  GamePageProvider? _gamePageProvider;
  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      create: (context) => GamePageProvider(context: context),
      child: Builder(builder: (_context) {
        _gamePageProvider = _context.watch<GamePageProvider>();
        double _level = _gamePageProvider!.level;
        return Scaffold(
          body: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Center(
                      child: Text(
                    "Frivia",
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  )),
                  Center(
                    child: Text(
                      _level == 0
                          ? "Easy"
                          : _level == 1
                              ? "Medium"
                              : "Hard",
                      style: const TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  )
                ],
              ),
              Slider(
                  max: 2,
                  divisions: 2,
                  value: _gamePageProvider!.level,
                  onChanged: (double value) {
                    _gamePageProvider!.changeLevel(value);
                  }),
              _startButton()
            ],
          )),
        );
      }),
    );
  }

  Widget _startButton() {
    return MaterialButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => GamePage()));
      },
      color: Colors.blue,
      minWidth: _deviceWidth! * 0.8,
      height: _deviceHeight! * 0.1,
      child: const Text(
        "Start",
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
    );
  }
}
