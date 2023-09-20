import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mep/Bloc/question/question_bloc.dart';
import 'package:mep/View/Questions/ScorePage.dart';
import 'package:mep/View/components/QuestionTile.dart';
import 'package:mep/View/components/SkipButton.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

//global variable....so that question_bloc can access it
bool timeUp = false;

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  late SharedPreferences _prefs;
  String? storedName;
  String? storedID;
  int seconds = 0;
  late Timer timer;
  final int durationInMunites = 50;
  @override
  void initState() {
    setState(() {
      BlocProvider.of<QuestionBloc>(context).add(GetQuestions(5, 5, 5, 5, 5));
    });
    //timer related
    seconds = durationInMunites * 60;
    startCountdown();
    super.initState();
    _loadStoredAnswer();
  }

  void startCountdown() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          timer.cancel();
          timeUp = true;
        }
      });
    });
  }

  String getTimerText() {
    int minutes = seconds ~/ 60;
    int _seconds = seconds % 60;
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (_seconds % 60).toString().padLeft(2, '0');
    return '$minutesStr:$secondsStr';
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void _loadStoredAnswer() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      storedName = _prefs.getString('name');
      storedID = _prefs.getString('password');
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocBuilder<QuestionBloc, QuestionState>(
        builder: (context, state) {
          if (state is QuestionInitialState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Getting ready...",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: height * 0.02,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  const CircularProgressIndicator(),
                ],
              ),
            );
          } else if (state is QuestionLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is QuestionFailState) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is QuestionSuccessState) {
            return Column(
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: width * 0.02,
                      right: width * 0.02,
                      top: height * 0.02,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Text(
                                  storedName!,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  storedID!,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'የቀረ ጊዜ: ${getTimerText()}',
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "ጥያቄ ${state.question![state.index].id} / 50",
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            QuestionTile(
                                id: state.question![state.index].id,
                                questionContent: state
                                    .question![state.index].questionContent,
                                choice1: state.question![state.index].choice1,
                                choice2: state.question![state.index].choice2,
                                choice3: state.question![state.index].choice3,
                                choice4: state.question![state.index].choice4,
                                choice5: state.question![state.index].choice5,
                                answer: state.question![state.index].answer,
                                topic: state.question![state.index].topic),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SkipButton(),
              ],
            );
          } else if (state is QuestionDoneState) {
            return ScorePage(
              name: storedName!,
              id: storedID!,
              score: state.score,
              total: state.total,
              comment: state.comment,
              scoreColor: state.scoreColor,
              retry: false,
            );
          }
          return Container();
        },
      ),
    );
  }
}
