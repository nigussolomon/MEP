import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mep/Bloc/question/question_bloc.dart';
import 'package:mep/View/Questions/QuestionsPage.dart';
import 'package:mep/View/components/LoginButton.dart';
import 'package:mep/View/components/QuestionField.dart';

class NumberOfQuestions extends StatefulWidget {
  const NumberOfQuestions({super.key});

  @override
  State<NumberOfQuestions> createState() => _NumberOfQuestionsState();
}

class _NumberOfQuestionsState extends State<NumberOfQuestions> {
  void buttonFunction() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => BlocProvider.value(value: questionBloc,
      child: const QuestionPage(),)),
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
                        Column(
                          children: [
                            SizedBox(
                              height: screenSize.height * 0.08,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "CURATE YOUR EXAM",
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
                            Padding(
                              padding: EdgeInsets.only(right: 40),
                              child: QuestionField(
                                fieldName: "ESSENTIALS",
                                hintText: "0",
                              ),
                            ),
                            SizedBox(
                              height: screenSize.height * 0.02,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 40),
                              child: QuestionField(
                                fieldName: "SAFETY AND YOUR VEHICLE",
                                hintText: "0",
                              ),
                            ),
                            SizedBox(
                              height: screenSize.height * 0.02,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 40),
                              child: QuestionField(
                                fieldName: "ROAD AND TRAFFIC SIGN",
                                hintText: "0",
                              ),
                            ),
                            SizedBox(
                              height: screenSize.height * 0.02,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 40),
                              child: QuestionField(
                                fieldName: "MOTORWAY RULES",
                                hintText: "0",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenSize.height * 0.05,
                        ),
                        LoginButton(
                          buttonName: "GENERATE YOUR EXAM",
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
