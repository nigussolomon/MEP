import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mep/Bloc/question/question_bloc.dart';
import 'package:mep/View/Questions/PracticeQuestionPage.dart';

class RetryButon extends StatefulWidget {
  const RetryButon({super.key});

  @override
  State<RetryButon> createState() => _RetryButonState();
}

class _RetryButonState extends State<RetryButon> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(height * 0.02),
      child: InkWell(
        onTap: () {
          final questionBloc = QuestionBloc();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: questionBloc,
                child: const PracticeQuestionPage(),
              ),
            ),
          );
        },
        onHover: (hovering) {
          setState(() => isHovering = hovering);
        },
        child: Container(
          padding: EdgeInsets.all(height * 0.023),
          height: height * 0.077,
          width: width * 0.15,
          decoration: BoxDecoration(
            color: isHovering
                ? Colors.grey[700]
                : const Color.fromARGB(255, 72, 72, 72),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              "እንደገና ይሞከሩ",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: height * 0.03,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
