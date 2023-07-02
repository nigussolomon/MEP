import 'package:flutter/material.dart';
import 'package:mep/View/IntroPages/numberOfQuestion.dart';
import 'package:mep/View/IntroPages/resourseList.dart';
import 'package:mep/View/IntroPages/startExam.dart';
import 'package:mep/View/components/LoginButton.dart';


class ChooseMenu extends StatefulWidget {
  const ChooseMenu({super.key});

  @override
  State<ChooseMenu> createState() => _ChooseMenuState();
}

class _ChooseMenuState extends State<ChooseMenu> {
  void questionConfiguration() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NumberOfQuestions()),
    );
  }

  void startExam() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const StartExamPage()),
    );
  }

  void resourceList() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ResourceList()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double imageWidth = screenSize.width * 0.5;

    return Scaffold(
      body: Center(
        child: Container(
          child: Row(
            children: [
              Expanded(
                child: Image.asset(
                  'asset/hero.png',
                  fit: BoxFit.cover,
                  width: imageWidth,
                  height: double.infinity,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.1),
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: screenSize.height * 0.05,
                        ),
                        const Text(
                          'MEP Berhan Driving Licence School',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF484848),
                          ),
                        ),
                        SizedBox(
                          height: screenSize.height * 0.1,
                        ),
                        LoginButton(
                          buttonName: "PRACTICE EXAM",
                          onPressed: questionConfiguration,
                        ),
                        SizedBox(height: screenSize.height * 0.02),
                        LoginButton(
                          buttonName: "START EXAMINATION",
                          onPressed: startExam,
                        ),
                        SizedBox(
                          height: screenSize.height * 0.02,
                        ),
                        LoginButton(
                          buttonName: "RESOURCES",
                          onPressed: resourceList,
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
