import 'package:flutter/material.dart';
import 'package:login/constans/colors.dart';
import 'package:login/constans/description.dart';
import 'package:login/constans/styles.dart';
import 'package:login/services/auth.dart';

class SignIn extends StatefulWidget {
  //function
  final Function toggle;
  const SignIn({super.key, required this.toggle});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //reference for the authentication service class
  final AuthServices _auth = AuthServices();

  //form key
  final _formKey = GlobalKey<FormState>();

  //store email and password
  String email = "";
  String password = "";
  String error = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgBlack,
        appBar: AppBar(
          backgroundColor: bgBlack,
          title: const Text(
            "Sign In",
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                //Description
                const Text(
                  description,
                  style: descriptionStyle,
                ),
                Center(
                  child: Image.asset(
                    "images/register.png",
                    height: 150,
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      //email
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        validator: (val) =>
                            val?.isEmpty == true ? "Enter an email" : null,
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                      ),
                      //password
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        obscureText: true,
                        validator: (val) =>
                            val!.length < 6 ? "Enter the valid password" : null,
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                      ),

                      const SizedBox(height: 10),

                      Center(
                        child: Text(
                          error,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                      //Google
                      const SizedBox(height: 10),
                      const Text(
                        "Login with using social account",
                        style: descriptionStyle,
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        //Sign In with Google
                        onTap: () {},
                        child: Center(
                          child: Image.asset(
                            "images/google.png",
                            height: 50,
                          ),
                        ),
                      ),

                      //register text
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: descriptionStyle,
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            //go to the register page
                            onTap: () {
                              widget.toggle();
                            },
                            child: const Text(
                              "REGISTER",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      //Button Under
                      GestureDetector(
                        //methode for login user
                        onTap: () async {
                          dynamic result = _auth.signInUsingEmailAndPassword(
                              email, password);
                          if (result == null) {
                            setState(() {
                              error = "Could not sign in this user";
                            });
                          }
                        },
                        child: Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                              color: bgBlack,
                              border: Border.all(width: 2, color: mainYellow),
                              borderRadius: BorderRadius.circular(100)),
                          child: const Center(
                              child: Text(
                            "Log In",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )),
                        ),
                      ),

                      const SizedBox(height: 15),

                      GestureDetector(
                        //methode for login user
                        onTap: () async {
                          await _auth.signInAnonymously();
                        },
                        child: Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                              color: bgBlack,
                              border: Border.all(width: 2, color: mainYellow),
                              borderRadius: BorderRadius.circular(100)),
                          child: const Center(
                              child: Text(
                            "Log As Guest",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

//  ElevatedButton(
//         child: const Text("Sign In Anonymously"),
//         onPressed: () async {
//           dynamic result = await _auth.signInAnonymously();
//           if (result == Null) {
//             print("Error signing in");
//           } else {
//             print("Signed in anonymously");
//             print(result.uid);
//           }
//         },
//       ),
