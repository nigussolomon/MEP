import 'package:flutter/material.dart';
import 'package:mep/View/components/ChoiceButton.dart';

class QuestionTile extends StatefulWidget {
  final int id;
  final String questionContent;
  final String choice1;
  final String choice2;
  final String choice3;
  final String choice4;
  final String answer;
  final String topic;
  const QuestionTile(
      {required this.id,
      required this.questionContent,
      required this.choice1,
      required this.choice2,
      required this.choice3,
      required this.choice4,
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
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(
            left: width * 0.3,
            right: width * 0.3,
            top: height * 0.3,
            bottom: height * 0.05,
          ),
          child: Column(
            children: [
              Text(
                widget.questionContent,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ChoiceButton(choiceContent: widget.choice1),
                      ChoiceButton(choiceContent: widget.choice2),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ChoiceButton(choiceContent: widget.choice3),
                      ChoiceButton(choiceContent: widget.choice4),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
