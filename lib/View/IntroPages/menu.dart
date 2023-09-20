import 'package:flutter/material.dart';
import 'package:mep/View/IntroPages/login.dart';
import 'package:mep/View/IntroPages/resourseList.dart';
import 'package:mep/View/components/LoginButton.dart';
import 'package:mep/View/IntroPages/examType.dart';
import 'package:mep/View/IntroPages/finalExamType.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseMenu extends StatefulWidget {
  const ChooseMenu({super.key});

  @override
  State<ChooseMenu> createState() => _ChooseMenuState();
}

class _ChooseMenuState extends State<ChooseMenu> {
  String? name_of_school = "";
  void questionConfiguration() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ExamType()),
    );
  }

  void startExam() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FinalExamType()),
    );
  }

  void resourceList() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ResourceList()),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadSavedValues();
  }

  void _loadSavedValues() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    name_of_school = prefs.getString("name_of_school");

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double imageWidth = screenSize.width * 0.5;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(top: 15, left: 15),
          child: CircleAvatar(
            backgroundColor: Color(0xFF484848),
            child: BackButton(
              color: Colors.white,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
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
                  padding:
                      EdgeInsets.symmetric(horizontal: screenSize.width * 0.1),
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: screenSize.height * 0.05,
                        ),
                        Text(
                          name_of_school!,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF484848),
                          ),
                        ),
                        SizedBox(
                          height: screenSize.height * 0.1,
                        ),
                        LoginButton(
                          buttonName: "መለመማመጃ ፈተና",
                          onPressed: questionConfiguration,
                        ),
                        SizedBox(height: screenSize.height * 0.02),
                        LoginButton(
                          buttonName: "ፈተና መውሰጃ",
                          onPressed: startExam,
                        ),
                        SizedBox(
                          height: screenSize.height * 0.02,
                        ),
                        LoginButton(
                          buttonName: "መረጃዎች",
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
