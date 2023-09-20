import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mep/Bloc/question/question_bloc.dart';
import 'package:mep/View/Questions/PracticeQuestionPage.dart';
import 'package:mep/View/components/LoginButton.dart';
import 'package:mep/View/components/QuestionField.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NumberOfQuestions extends StatefulWidget {
  const NumberOfQuestions({super.key});

  @override
  State<NumberOfQuestions> createState() => _NumberOfQuestionsState();
}

class _NumberOfQuestionsState extends State<NumberOfQuestions> {
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
                child: const PracticeQuestionPage(),
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
                        Column(
                          children: [
                            SizedBox(
                              height: screenSize.height * 0.08,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "የ ፈተናወን ጥያቄ ያዋቅሩ",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF484848),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 40),
                                  child: Container(
                                    width: 50,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF484848),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "100%",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: screenSize.height * 0.02,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 40),
                              child: QuestionField(
                                fieldName: "ንግግር",
                                hintText: "0",
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 40),
                              child: QuestionField(
                                fieldName: "መንዳት 1",
                                hintText: "0",
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 40),
                              child: QuestionField(
                                fieldName: "መንዳት 2",
                                hintText: "0",
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 40),
                              child: QuestionField(
                                fieldName: "ድንገተኛ አደጋ",
                                hintText: "0",
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 40),
                              child: QuestionField(
                                fieldName: "ጭነት እና ተሳፋሪ",
                                hintText: "0",
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 40),
                              child: QuestionField(
                                fieldName: "ቴክኒክ",
                                hintText: "0",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenSize.height * 0.05,
                        ),
                        LoginButton(
                          buttonName: "የ ሙከራ ፈተናወን ጀምር",
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
