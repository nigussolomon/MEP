import 'package:flutter/material.dart';
import 'package:mep/View/components/ChoiceButton.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({super.key});

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
              "You score is 45/50 \n\t\t\t\t\t\t\tWelldone",
              style: TextStyle(
                fontSize: height * 0.05,
                color: Colors.green,
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
