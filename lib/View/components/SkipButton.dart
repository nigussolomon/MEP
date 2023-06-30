import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        print("Working....");
      },
      child: Padding(
        padding: EdgeInsets.all(height * 0.05),
        child: Container(
          padding: EdgeInsets.all(height * 0.023),
          height: height * 0.077,
          width: width * 0.15,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 72, 72, 72),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Skip Question",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: height * 0.02,
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
      ),
    );
  }
}
