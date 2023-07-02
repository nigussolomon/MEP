import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400, // Adjust the width as needed
      child: TextField(
        obscureText:obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
