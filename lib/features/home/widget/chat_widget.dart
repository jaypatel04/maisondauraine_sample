import 'package:flutter/material.dart';
import 'package:maisondauraine/features/login/model/login_model.dart';

class ChatWidget extends StatefulWidget {
  final LoginModel loginModel;

  const ChatWidget({required this.loginModel, Key? key}) : super(key: key);

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chat',
        ),
      ),
      body: ListView.builder(
        itemCount: 25,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(widget.loginModel.userName),
            subtitle: Text(widget.loginModel.password),
          );
        },
      ),
    );
  }
}
