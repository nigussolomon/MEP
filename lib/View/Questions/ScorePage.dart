import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mep/View/components/MenuButton.dart';
import 'package:mep/View/components/RetryButton.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfWidgets;

class ScorePage extends StatelessWidget {
  final String name;
  final String id;
  final int score;
  final int total;
  final String comment;
  final Color scoreColor;
  final bool retry;
  const ScorePage(
      {required this.score,
      required this.name,
      required this.id,
      required this.total,
      required this.comment,
      required this.scoreColor,
      required this.retry,
      super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final pdfScoreColor =
        PdfColor.fromInt((scoreColor.value & 0x00FFFFFF) | 0xFF000000);

    void printScorePage(BuildContext context) async {
      final pdf = pdfWidgets.Document();

      // Load the font
      final customFont = pdfWidgets.Font.ttf(
          await rootBundle.load("asset/AbyssinicaSIL-Regular.ttf"));

      final page = pdfWidgets.Page(
        build: (context) {
          return pdfWidgets.Center(
            child: pdfWidgets.Column(
                mainAxisAlignment: pdfWidgets.MainAxisAlignment.center,
                children: [
                  pdfWidgets.Text(
                    name,
                    style: pdfWidgets.TextStyle(
                      fontSize: height * 0.05,
                      font: customFont, // Set the custom font here
                    ),
                  ),
                  pdfWidgets.Text(
                    id,
                    style: pdfWidgets.TextStyle(
                      fontSize: height * 0.05,
                      font: customFont, // Set the custom font here
                    ),
                  ),
                  pdfWidgets.Text(
                    "ፈተናውን ጨርሰዋል",
                    style: pdfWidgets.TextStyle(
                      fontSize: height * 0.05,
                      font: customFont, // Set the custom font here
                    ),
                  ),
                  pdfWidgets.SizedBox(
                    height: height * 0.025,
                  ),
                  pdfWidgets.Text(
                    "ውጤትዎ $score/50",
                    style: pdfWidgets.TextStyle(
                      fontSize: height * 0.05,
                      color: pdfScoreColor,
                      font: customFont, // Set the custom font here
                    ),
                  ),
                ]),
          );
        },
      );

      pdf.addPage(page);
      final pdfFileName = '$name-$id Score.pdf';

      Printing.layoutPdf(
        name: pdfFileName,
        onLayout: (format) => pdf.save(),
      );
    }

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
              "ውጤትዎ $score/50",
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
            if (retry)
              Padding(
                padding: EdgeInsets.only(left: width * 0.2, right: width * 0.2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const RetryButon(),
                    const MenuButton(),
                    SizedBox(
                      width: 150, // Adjust the width as needed
                      child: SizedBox(
                        height: 60, // Adjust the height as needed
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF484848),
                            onPrimary: Colors.white,
                          ),
                          onPressed: () async {
                            printScorePage(context);
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "ፕሪንት",
                                style: TextStyle(fontSize: 20),
                              ),
                              Icon(
                                Icons.print,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            else
              Padding(
                padding: EdgeInsets.only(left: width * 0.2, right: width * 0.2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const MenuButton(),
                    SizedBox(
                      width: 150, // Adjust the width as needed
                      child: SizedBox(
                        height: 60, // Adjust the height as needed
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF484848),
                            onPrimary: Colors.white,
                          ),
                          onPressed: () async {
                            printScorePage(context);
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "ፕሪንት",
                                style: TextStyle(fontSize: 20),
                              ),
                              Icon(
                                Icons.print,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
