import 'package:flutter/material.dart';
import 'package:login/constans/colors.dart';
import 'package:login/constans/description.dart';
import 'package:login/services/auth.dart';

class Home extends StatelessWidget {
  Home({super.key});

  // Create an instance of AuthServices
  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: bgBlack,
          appBar: AppBar(
            backgroundColor: bgBlack,
            elevation: 0,
            title: const Text("Home"),
            actions: [
              ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(bgBlack)),
                onPressed: () async {
                  await _auth.signOut();
                },
                child: const Icon(Icons.logout_rounded),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: [
                  const Text(
                    "HOME",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textLite,
                      fontSize: 10,
                    ),
                  ),
                  Center(child: Image.asset("images/register.png")),
                ],
              ),
            ),
          )),
    );
  }
}
