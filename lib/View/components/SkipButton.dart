import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mep/Bloc/question/question_bloc.dart';

class SkipButton extends StatefulWidget {
  const SkipButton({super.key});

  @override
  State<SkipButton> createState() => _SkipButtonState();
}

class _SkipButtonState extends State<SkipButton> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () => BlocProvider.of<QuestionBloc>(context).add(SkipQuestion()),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "ጥያቄ ይዝለሉ",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: height * 0.03,
              ),
            ),
            Icon(
              Icons.arrow_right_alt_outlined,
              color: Colors.white,
              size: height * 0.04,
            ),
          ],
        ),
      ),
    );
  }
}
