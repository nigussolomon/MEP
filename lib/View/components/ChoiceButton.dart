import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mep/Bloc/question/question_bloc.dart';

class ChoiceButton extends StatelessWidget {
  final String choiceContent;
  const ChoiceButton({
    required this.choiceContent,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(height * 0.02),
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<QuestionBloc>(context).add(ChooseAnswer());
        },
        child: Container(
          padding: EdgeInsets.all(height * 0.023),
          height: height * 0.077,
          width: width * 0.15,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 72, 72, 72),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              choiceContent,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: height * 0.02,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
