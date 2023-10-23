import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double? _deviceHeight, _deviceWidth;
  final GlobalKey<FormState> _loginFormkey = GlobalKey<FormState>();
  String? _email, _password;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: _deviceWidth! * 0.05),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _titleWidget(),
            _loginForm(),
            _loginButton(),
          ],
        )),
      )),
    );
  }

  Widget _titleWidget() => const Text(
        "Finstagram",
        style: TextStyle(
            color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),
      );

  Widget _loginButton() => MaterialButton(
        onPressed: () {},
        minWidth: _deviceWidth! * 0.7,
        height: _deviceHeight! * 0.06,
        color: Colors.red,
        child: const Text(
          "Login",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
        ),
      );

  Widget _loginForm() {
    return Container(
      height: _deviceHeight! * 0.20,
      child: Form(
          key: _loginFormkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [_emailTextField()],
          )),
    );
  }

  Widget _emailTextField() => TextFormField(
        decoration: const InputDecoration(hintText: "Email..."),
        onSaved: (_value) {
          setState(() {
            _email = _value;
          });
        },
        validator: (_value) {
          _value!.contains(RegExp(r""));
        },
      );

  Widget _passwordTextField() => TextFormField(
      decoration: const InputDecoration(hintText: "Email..."),
      onSaved: (_value) {
        setState(() {
          _password = _value;
        });
      });
}
