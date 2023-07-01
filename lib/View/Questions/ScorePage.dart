import 'package:flutter/material.dart';
import 'package:mep/View/components/ChoiceButton.dart';

class ScorePage extends StatelessWidget {
  final int score;
  final int total;
  final String comment;
  final Color scoreColor;
  const ScorePage(
      {required this.score,
      required this.total,
      required this.comment,
      required this.scoreColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: height * 0.25,
        ),
        child: Column(
          children: [
            Text(
              "You have finished the Exam",
              style: TextStyle(
                fontSize: height * 0.05,
              ),
            ),
            SizedBox(
              height: height * 0.025,
            ),
            Text(
              "Your score is $score/$total",
              style: TextStyle(
                fontSize: height * 0.05,
                color: scoreColor,
              ),
            ),
            Text(
              comment,
              style: TextStyle(
                fontSize: height * 0.05,
                color: scoreColor,
              ),
            ),
            SizedBox(
              height: height * 0.2,
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.2, right: width * 0.2),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ChoiceButton(choiceContent: "Retry"),
                  ChoiceButton(choiceContent: "MainMenu"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}