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
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1, mainAxisExtent: 80),
              itemCount: 5,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final choiceContent =
                    getChoiceContent(index); // Implement this method
                return ChoiceButton(choiceContent: choiceContent);
              },
            ),
          ],
        ),
      ),
    );
  }

  String getChoiceContent(int index) {
    switch (index) {
      case 0:
        return widget.choice1;
      case 1:
        return widget.choice2;
      case 2:
        return widget.choice3;
      case 3:
        return widget.choice4;
      case 4:
        return widget.choice5;
      default:
        return '';
    }
  }
}
