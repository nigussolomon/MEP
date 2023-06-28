import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mep/Bloc/question/question_bloc.dart';
import 'package:mep/View/components/QuestionTile.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  void initState() {
    BlocProvider.of<QuestionBloc>(context).add(GetQuestions());
    super.initState();
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
          } else if (state is QuestionSuccessState) {
            return Column(
              children: [
                const QuestionTile(
                  id: 1,
                  questionContent: "What does this sign show",
                  choice1: "A stop sign",
                  choice2: "A go sign",
                  choice3: "A watch out sign",
                  choice4: "A slow down sign",
                  answer: "",
                  topic: "",
                ),
                Padding(
                  padding: EdgeInsets.all(height * 0.05),
                  child: Container(
                    padding: EdgeInsets.all(height * 0.023),
                    height: height * 0.077,
                    width: width * 0.15,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 72, 72, 72),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Skip Question",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: height * 0.02,
                          ),
                        ),
                        Icon(
                          Icons.arrow_right_alt_outlined,
                          color: Colors.white,
                          size: height * 0.04,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
