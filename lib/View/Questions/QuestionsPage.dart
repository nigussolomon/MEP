import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mep/Bloc/question/question_bloc.dart';
import 'package:mep/View/Questions/ScorePage.dart';
import 'package:mep/View/components/QuestionTile.dart';
import 'package:mep/View/components/SkipButton.dart';
import 'dart:async';

//global variable....so that question_bloc can access it
bool timeUp = false;

class QuestionPage extends StatefulWidget {
  final bool isOnExamPage;
  const QuestionPage({
    required this.isOnExamPage,
    super.key,
  });

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int seconds = 0;
  Timer timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {});
  final int durationInMunites = 60;
  @override
  void initState() {
    setState(() {
      BlocProvider.of<QuestionBloc>(context).add(GetQuestions());
    });
    //timer related
    seconds = durationInMunites * 60;
    if (widget.isOnExamPage) {
      startCountdown();
    }
    super.initState();
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
                        Text(
                          widget.isOnExamPage
                              ? 'የቀረ ጊዜ: ${getTimerText()}'
                              : "",
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Column(
                          children: [
                            QuestionTile(
                                id: state.question?[state.index].id,
                                questionContent: state
                                    .question![state.index].questionContent,
                                choice1: state.question![state.index].choice1,
                                choice2: state.question![state.index].choice2,
                                choice3: state.question![state.index].choice3,
                                choice4: state.question![state.index].choice4,
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
              isOnExamPage: widget.isOnExamPage,
              score: state.score,
              total: state.total,
              comment: state.comment,
              scoreColor: state.scoreColor,
            );
          }
          return Container();
        },
      ),
    );
  }
}
