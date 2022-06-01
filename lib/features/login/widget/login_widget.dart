import 'package:flutter/material.dart';
import 'package:maisondauraine/features/login/model/login_model.dart';
import 'package:maisondauraine/main.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _buttonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Maisondauraine',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Sign in',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                onChanged: (newValue) {
                  if (newValue.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    _enableLoginButton();
                  } else {
                    _disableLoginButton();
                  }
                  setState(() {});
                },
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                onChanged: (newValue) {
                  if (newValue.isNotEmpty && nameController.text.isNotEmpty) {
                    _enableLoginButton();
                  } else {
                    _disableLoginButton();
                  }
                  setState(() {});
                },
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text('Sign in'),
                onPressed: _buttonEnabled
                    ? () {
                        LoginModel model = LoginModel(
                          userName: nameController.text,
                          password: passwordController.text,
                        );
                        Navigator.pushNamed(
                          context,
                          homeWidget,
                          arguments: model,
                        );
                      }
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _enableLoginButton() {
    _buttonEnabled = true;
  }

  void _disableLoginButton() {
    _buttonEnabled = false;
  }
}
