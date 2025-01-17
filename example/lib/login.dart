import 'package:agora_chat_callkit/agora_chat_callkit.dart';
import 'package:flutter/material.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String userId = "";
  String tokenOrPwd = "";

  @override
  Widget build(BuildContext context) {
    Widget content = Column(
      children: [
        Expanded(
          child: TextField(
            decoration: const InputDecoration(hintText: "userId"),
            onChanged: (value) {
              userId = value;
            },
          ),
        ),
        Expanded(
          child: TextField(
            decoration:
                const InputDecoration(hintText: "password / agoraToken"),
            onChanged: (value) {
              tokenOrPwd = value;
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: loginWithPassword,
                child: const Text("login password")),
            const SizedBox(
              width: 20,
            ),
            ElevatedButton(
                onPressed: loginWithAgoraToken,
                child: const Text("login agoraToken"))
          ],
        ),
      ],
    );

    content = SizedBox(
        height: 150,
        width: MediaQuery.of(context).size.width - 50,
        child: content);

    content = Center(child: content);

    return content;
  }

  Future<void> loginWithAgoraToken() async {
    if (userId.isEmpty || tokenOrPwd.isEmpty) {
      EasyLoading.showError('userId or agora token is null');
      return;
    }
    EasyLoading.show(status: "Sign in...");
    try {
      await ChatClient.getInstance.loginWithAgoraToken(userId, tokenOrPwd);
      pushToHome();
    } on ChatError catch (e) {
      EasyLoading.showError(e.description);
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> loginWithPassword() async {
    if (userId.isEmpty || tokenOrPwd.isEmpty) {
      EasyLoading.showError('userId or password is null');
      return;
    }
    EasyLoading.show(status: "Sign in...");
    try {
      await ChatClient.getInstance.login(userId, tokenOrPwd);
      pushToHome();
    } on ChatError catch (e) {
      EasyLoading.showError(e.description);
    } finally {
      EasyLoading.dismiss();
    }
  }

  void pushToHome() {
    Navigator.of(context).pushNamed("home");
  }
}
