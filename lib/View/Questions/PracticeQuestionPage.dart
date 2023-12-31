import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mep/Bloc/question/question_bloc.dart';
import 'package:mep/View/Questions/ScorePage.dart';
import 'package:mep/View/components/QuestionTile.dart';
import 'package:mep/View/components/SkipButton.dart';
import 'package:shared_preferences/shared_preferences.dart';

//global variable....so that question_bloc can access it

class PracticeQuestionPage extends StatefulWidget {
  const PracticeQuestionPage({super.key});

  @override
  State<PracticeQuestionPage> createState() => _PracticeQuestionPageState();
}

class _PracticeQuestionPageState extends State<PracticeQuestionPage> {
  late SharedPreferences _prefs;
  String? storedName;
  String? storedID;
  int seconds = 0;
  int? cdc;
  int? cdlp;
  int? cdt;
  int? cdd;
  int? cde;
  final int durationInMunites = 50;
  @override
  void initState() {
    super.initState();
    _loadStoredAnswer();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _loadStoredAnswer() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      storedName = _prefs.getString('name');
      storedID = _prefs.getString('password');
      cdc = _prefs.getInt("ንግግር");
      cdlp = _prefs.getInt("ጭነት እና ተሳፋሪ");
      cdt = _prefs.getInt("ቴክኒክ");
      cdd = _prefs.getInt("መንዳት 1");
      cde = _prefs.getInt("ድንገተኛ አደጋ");
    });
    BlocProvider.of<QuestionBloc>(context)
        .add(GetQuestions(cdc!, cdlp!, cdt!, cdd!, cde!));
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                retry: true);
          }
          return Container();
        },
      ),
    );
  }
}
