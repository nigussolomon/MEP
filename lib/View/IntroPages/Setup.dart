import 'package:flutter/material.dart';
import 'package:mep/View/IntroPages/login.dart';
import 'package:mep/View/components/LoginButton.dart';
import 'package:mep/View/components/LoginTextField.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({super.key});

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  TextEditingController nameController = TextEditingController();

  void buttonFunction() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name_of_school', nameController.text);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadSavedValues();
  }

  void _loadSavedValues() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name_of_school = prefs.getString("name_of_school");
    if (name_of_school != null && name_of_school != "") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
    setState(() {
      prefs.setString('name', '');
      prefs.setString('password', '');
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double imageWidth = screenSize.width * 0.5;

    return Scaffold(
      body: Center(
        child: Container(
          child: Row(
            children: [
              Expanded(
                child: Image.asset(
                  'asset/hero.png',
                  fit: BoxFit.cover,
                  width: imageWidth,
                  height: double.infinity,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100.0),
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: screenSize.height * 0.04,
                        ),
                        SizedBox(height: screenSize.height * 0.02),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'SETUP APP',
                            style: TextStyle(
                              fontSize: 23,
                            ),
                          ),
                        ),
                        SizedBox(height: screenSize.height * 0.02),
                        MyTextField(
                          controller: nameController,
                          hintText: "ስም",
                          obscureText: false,
                        ),
                        SizedBox(height: screenSize.height * 0.02),
                        LoginButton(
                          buttonName: "ይግቡ",
                          onPressed: buttonFunction,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
