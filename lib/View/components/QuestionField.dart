import 'package:flutter/material.dart';

class QuestionField extends StatefulWidget {
  final String fieldName;
  final String hintText;

  const QuestionField({
    Key? key,
    required this.fieldName,
    required this.hintText,
  }) : super(key: key);

  @override
  _QuestionFieldState createState() => _QuestionFieldState();
}

class _QuestionFieldState extends State<QuestionField> {
  double _sliderValue = 25.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.fieldName,
          style: TextStyle(fontSize: 20, color: Color(0xFF484848)),
        ),
        Container(
          width: 200,
          child: Slider(
            value: _sliderValue,
            min: 0,
            max: 50,
            onChanged: (newValue) {
              setState(() {
                _sliderValue = newValue;
              });
            },
          ),
        ),
        Text(
          _sliderValue.toStringAsFixed(0),
          style: TextStyle(fontSize: 20, color: Color(0xFF484848)),
        ),
      ],
    );
  }
}
