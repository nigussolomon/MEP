import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mep/Bloc/question/question_bloc.dart';

class ChoiceButton extends StatefulWidget {
  final String? choiceContent;

  const ChoiceButton({
    required this.choiceContent,
    Key? key,
  }) : super(key: key);

  @override
  State<ChoiceButton> createState() => _ChoiceButtonState();
}

class _ChoiceButtonState extends State<ChoiceButton> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    if (widget.choiceContent == "") {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            constraints:
                const BoxConstraints(minWidth: 0, maxWidth: double.infinity),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: isHovering
                  ? Colors.grey[700]
                  : const Color.fromARGB(255, 72, 72, 72),
              borderRadius: BorderRadius.circular(5),
            ),
            child: InkWell(
              onTap: () => BlocProvider.of<QuestionBloc>(context)
                  .add(ChooseAnswer(widget.choiceContent!)),
              onHover: (hovering) {
                setState(() => isHovering = hovering);
              },
              child: Center(
                child: Text(
                  widget.choiceContent!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
