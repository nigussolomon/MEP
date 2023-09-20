import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mep/Bloc/question/question_bloc.dart';
import 'package:mep/View/Questions/QuestionsPage.dart';
import 'package:mep/View/components/LoginButton.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartExamPage extends StatefulWidget {
  const StartExamPage({super.key});

  @override
  State<StartExamPage> createState() => _StartExamPageState();
}

class _StartExamPageState extends State<StartExamPage> {
  String? name_of_school = "";

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

  void buttonFunction() {
    final questionBloc = QuestionBloc();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => BlocProvider.value(
                value: questionBloc,
                child: const QuestionPage(),
              )),
    );
  }

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
                          height: screenSize.height * 0.2,
                        ),
                        const Text(
                          'የ ፈተናው ጥያቄ ይዘት 50 ጥያቄ ሲሆን ጥያቄዎቹን ለ ማጠናቀቅ የሚሰጥው ደቂቃ 50 ደቂቃ ነው',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF484848),
                          ),
                        ),
                        SizedBox(height: screenSize.height * 0.04),
                        LoginButton(
                          buttonName: "መፈተን ይጀምሩ",
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
