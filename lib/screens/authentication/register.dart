import 'package:flutter/material.dart';
import 'package:login/constans/colors.dart';
import 'package:login/constans/description.dart';
import 'package:login/constans/styles.dart';
import 'package:login/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggle;
  const Register({super.key, required this.toggle});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
            "Register",
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
                        decoration: textInputDecoration,
                        validator: (val) =>
                            val?.isEmpty == true ? "Enter an email" : null,
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      //password
                      TextFormField(
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        decoration: textInputDecoration.copyWith(
                          hintText: "Password",
                        ),
                        validator: (val) =>
                            val!.length < 6 ? "Enter the valid password" : null,
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                      ),

                      //Google
                      const SizedBox(height: 10),
                      //display error text
                      Text(
                        error,
                        style: const TextStyle(color: Colors.red),
                      ),
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
                              "Login",
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
                          dynamic result =
                              await _auth.RegisterWithEmailAndPassword(
                                  email, password);

                          if (result == null) {
                            setState(() {
                              error = "Please enter a valid email";
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
                            "Register",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )),
                        ),
                      ),

                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
