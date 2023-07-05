import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mep/Bloc/question/question_bloc.dart';
import 'package:mep/View/Questions/ScorePage.dart';
import 'package:mep/View/components/QuestionTile.dart';
import 'package:mep/View/components/SkipButton.dart';
import 'dart:async';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int seconds = 0;
  late Timer timer;
  final int durationInMunites = 2;
  @override
  void initState() {
    setState(() {
      BlocProvider.of<QuestionBloc>(context).add(GetQuestions());
    });
    //timer related
    seconds = durationInMunites * 60;
    startCountdown();
    super.initState();
  }

  void startCountdown() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          timer.cancel();
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
                  child: Column(
                    children: [
                      QuestionTile(
                          id: state.question?[state.index].id,
                          questionContent:
                              state.question![state.index].questionContent,
                          choice1: state.question![state.index].choice1,
                          choice2: state.question![state.index].choice2,
                          choice3: state.question![state.index].choice3,
                          choice4: state.question![state.index].choice4,
                          answer: state.question![state.index].answer,
                          topic: state.question![state.index].topic),
                      Text('Elapsed Time: ${getTimerText()}'),
                    ],
                  ),
                ),
                const SkipButton(),
              ],
            );
          } else if (state is QuestionDoneState) {
            return ScorePage(
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
