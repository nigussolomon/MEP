import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  void buttonFunction(int num) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(widget.fieldName, num);
  }

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
          width: 180,
          child: Slider(
            value: _sliderValue,
            min: 0,
            max: 50,
            onChanged: (newValue) {
              setState(() {
                _sliderValue = newValue;
                buttonFunction(newValue.toInt());
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
