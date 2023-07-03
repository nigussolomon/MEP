import 'package:flutter/material.dart';

class QuestionField extends StatelessWidget {
  final String fieldName;
  final String hintText;

  const QuestionField({
    super.key,
    required this.fieldName,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          fieldName,
          style: TextStyle(fontSize: 20, color: Color(0xFF484848)),
        ),
        Container(
          width: 50,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: TextField(
              maxLength: 2,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                counterText:'',
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.black),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
