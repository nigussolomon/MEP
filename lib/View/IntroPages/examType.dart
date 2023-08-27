import 'package:flutter/material.dart';
import 'package:mep/View/components/LoginButton.dart';
import 'package:mep/View/IntroPages/numberOfQuestion.dart';

class ExamType extends StatefulWidget {
  const ExamType({super.key});

  @override
  State<ExamType> createState() => _ExamTypeState();
}

class _ExamTypeState extends State<ExamType> {
  void buttonFunction() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NumberOfQuestions()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double imageWidth = screenSize.width * 0.5;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(top: 15, left: 15),
          child: CircleAvatar(
            backgroundColor: Color(0xFF484848),
            child: BackButton(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          child: Row(
            children: [
              Expanded(
                child: Image.asset(
                  'asset/hero.png',
                  fit: BoxFit.cover,
                  width: imageWidth,
                  height: double.infinity,
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenSize.width * 0.1),
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: screenSize.height * 0.05,
                        ),
                        const Text(
                          'ብርሃን የ ተሽከርካሪ እና የ መንጃ ፍቃድ ማሰልጠኛ ተቋም',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF484848),
                          ),
                        ),
                        SizedBox(
                          height: screenSize.height * 0.05,
                        ),
                        // Buttons arranged in rows
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: LoginButton(
                                buttonName: "ሞተር ሳይክል",
                                onPressed: buttonFunction,
                              ),
                            ),
                            SizedBox(
                                width:
                                     screenSize.width * 0.02,),
                            Expanded(
                              child: LoginButton(
                                buttonName: "አውቶሞቢል",
                                onPressed: buttonFunction,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height:  screenSize.height * 0.05,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: LoginButton(
                                buttonName: "ታክሲ 1",
                                onPressed: buttonFunction,
                              ),
                            ),
                            SizedBox(
                                width:
                                     screenSize.width * 0.02,),
                            Expanded(
                              child: LoginButton(
                                buttonName: "ታክሲ 2",
                                onPressed: buttonFunction,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height:  screenSize.height * 0.05,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: LoginButton(
                                buttonName: "ደረቅ 1",
                                onPressed: buttonFunction,
                              ),
                            ),
                            SizedBox(
                                width:
                                     screenSize.width * 0.02,),
                            Expanded(
                              child: LoginButton(
                                buttonName: "ደረቅ 2",
                                onPressed: buttonFunction,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height:  screenSize.height * 0.05,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: LoginButton(
                                buttonName: "ደረቅ 3",
                                onPressed: buttonFunction,
                              ),
                            ),
                            SizedBox(
                                width:
                                     screenSize.width * 0.02,),
                            Expanded(
                              child: LoginButton(
                                buttonName: "ህዝብ 1",
                                onPressed: buttonFunction,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height:  screenSize.height * 0.05,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: LoginButton(
                                buttonName: "ህዝብ 2",
                                onPressed: buttonFunction,
                              ),
                            ),
                            SizedBox(
                                width:
                                     screenSize.width * 0.02,),
                            Expanded(
                              child: SizedBox(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
