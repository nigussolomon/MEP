import 'package:flutter/material.dart';

class BlockedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'App needs update',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.red,
                ),
              ),
              Text(
                'Please update to continue.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
