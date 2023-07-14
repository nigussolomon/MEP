import 'package:flutter/material.dart';
import 'package:mep/View/components/MenuButton.dart';
import 'package:mep/View/components/RetryButton.dart';

class ScorePage extends StatelessWidget {
  final bool isOnExamPage;
  final int score;
  final int total;
  final String comment;
  final Color scoreColor;
  const ScorePage(
      {required this.isOnExamPage,
      required this.score,
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
              "ፈተናውን ጨርሰዋል",
              style: TextStyle(
                fontSize: height * 0.05,
              ),
            ),
            SizedBox(
              height: height * 0.025,
            ),
            Text(
              "ውጤትዎ $score/$total",
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
                child: isOnExamPage
                    ? const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MenuButton(),
                        ],
                      )
                    : const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RetryButon(),
                          MenuButton(),
                        ],
                      )),
          ],
        ),
      ),
    );
  }
}
