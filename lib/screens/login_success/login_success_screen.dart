import 'package:flutter/material.dart';

import 'components/body.dart';

class LoginSuccessScreen extends StatelessWidget {
  static String routeName = "/login_success";

  const LoginSuccessScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const SizedBox(),
        title: const Text("Iniciaste sesión"),
      ),
      body: const Body(),
    );
  }
}
