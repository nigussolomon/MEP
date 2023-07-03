import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mep/Bloc/question/question_bloc.dart';

class MenuButton extends StatefulWidget {
  const MenuButton({super.key});

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
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
                child: const Placeholder(),
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
              "MainMenu",
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
    ;
  }
}
