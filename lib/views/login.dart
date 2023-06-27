import 'package:flutter/material.dart';
import 'package:mep/views/components/LoginButton.dart';
import 'package:mep/views/components/LoginTextField.dart';
import 'package:mep/views/menu.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void buttonFunction() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const ChooseMenu()),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Row(
            children: [
              Expanded(
                child: Image.asset(
                  'asset/hero.png',
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100.0),
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        const Text(
                          'MEP Berhan Driving Licence School',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF484848)),
                        ),
                        SizedBox(
                            height:
                                120), // Add spacing between the title and other elements
                        const Text(
                          'WELCOME TO YOUR DRIVING LICENSE EXAMINATION',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF484848)),
                        ),
                        SizedBox(height: 20),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                              fontSize: 23,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        MyTextField(
                          hintText: "Username",
                          obscureText: false,
                        ),
                        SizedBox(height: 10),
                        MyTextField(
                          hintText: "Password",
                          obscureText: true,
                        ),
                        SizedBox(height: 10),
                        LoginButton(
                          buttonName: "LOGIN",
                          onPressed: buttonFunction,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
