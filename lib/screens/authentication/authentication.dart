import 'package:flutter/material.dart';
import 'package:login/screens/authentication/register.dart';
import 'package:login/screens/authentication/signin.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  //toggle
  bool signinPage = true;

  void switchPage() {
    setState(() {
      signinPage = !signinPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (signinPage == true) {
      return SignIn(toggle: switchPage);
    } else {
      return Register(
        toggle: switchPage,
      );
    }
  }
}
