import 'package:flutter/material.dart';
import 'package:mep/View/IntroPages/menu.dart';
import 'package:mep/View/components/LoginButton.dart';
import 'package:mep/View/components/LoginTextField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void buttonFunction() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChooseMenu()),
    );
  }

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
                        const Text(
                          'ብርሃን የ ተሽከርካሪ እና የ መንጃ ፍቃድ ማሰልጠኛ ተቋም',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF484848),
                          ),
                        ),
                        SizedBox(
                          height: screenSize.height * 0.12,
                        ),
                        const Text(
                          'እንኳን ወደ መፈተኛው ቦታ በሰላም መጡ',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF484848),
                          ),
                        ),
                        SizedBox(height: screenSize.height * 0.02),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'መግቢያ',
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
                        MyTextField(
                          controller: passwordController,
                          hintText: "መለያ ቁጥር",
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
