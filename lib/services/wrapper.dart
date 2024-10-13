import 'package:flutter/material.dart';
import 'package:login/moduls/UserModel.dart';
import 'package:login/screens/authentication/authentication.dart';
import 'package:login/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);

    if (user == null) {
      return const Authenticate();
    } else {
      return Home();
    }
  }
}
