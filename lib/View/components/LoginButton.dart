import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Function()? onPressed;
  
  final String buttonName;

  const LoginButton({
    super.key,
    required this.buttonName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400, // Adjust the width as needed
      child: SizedBox(
        height: 60, // Adjust the height as needed
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF484848),
            onPrimary: Colors.white,
          ),
          onPressed:onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                buttonName,
                style: TextStyle(fontSize: 16),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
