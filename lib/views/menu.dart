import 'package:flutter/material.dart';
import 'package:mep/views/components/LoginButton.dart';
import 'package:mep/views/login.dart';
import 'package:mep/views/resourseList.dart';
import 'package:mep/views/startExam.dart';

class ChooseMenu extends StatefulWidget {
  const ChooseMenu({super.key});

  @override
  State<ChooseMenu> createState() => _ChooseMenuState();
}

class _ChooseMenuState extends State<ChooseMenu> {
  void buttonFunction() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }
  void startExam() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const StartExamPage()),
    );
  }
  void resourceList() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const ResourceList()),
    );
  }

  @override
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
                      mainAxisAlignment:
                          MainAxisAlignment.start, // Align content from top
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        const Text(
                          'MEP Berhan Driving Licence School', // Add the title
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF484848)),
                        ),
                        SizedBox(
                            height:
                                120), // Add spacing between the title and other elements
                        LoginButton(
                          buttonName: "PRACTICE EXAM",
                          onPressed: buttonFunction,
                        ),
                        SizedBox(height: 20),
                        LoginButton(
                          buttonName: "START EXAMINATION",
                          onPressed: startExam,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        LoginButton(
                          buttonName: "RESOURCES",
                          onPressed: resourceList,
                        )
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
