import 'package:flutter/material.dart';
import 'package:mep/View/components/ChoiceButton.dart';

class QuestionTile extends StatefulWidget {
  final int id;
  final String questionContent;
  final String choice1;
  final String choice2;
  final String choice3;
  final String choice4;
  final String choice5;
  final String answer;
  final String topic;
  const QuestionTile(
      {required this.id,
      required this.questionContent,
      required this.choice1,
      required this.choice2,
      required this.choice3,
      required this.choice4,
      required this.choice5,
      required this.answer,
      required this.topic,
      super.key});

  @override
  State<QuestionTile> createState() => _QuestionTileState();
}

class _QuestionTileState extends State<QuestionTile> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: Padding(
        padding: EdgeInsets.only(
          top: height * 0.1,
          left: width * 0.05,
          right: width * 0.05,
          bottom: height * 0.05,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${widget.id}| ${widget.questionContent}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              textAlign: TextAlign.center,
            ),
            Column(
              children: [
                ChoiceButton(choiceContent: widget.choice1),
                ChoiceButton(choiceContent: widget.choice2),
                ChoiceButton(choiceContent: widget.choice3),
                ChoiceButton(choiceContent: widget.choice4),
                ChoiceButton(choiceContent: widget.choice5),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
