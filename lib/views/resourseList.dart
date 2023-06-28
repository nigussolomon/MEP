import 'package:flutter/material.dart';
import 'package:mep/views/components/LoginButton.dart';

class ResourceList extends StatefulWidget {
  const ResourceList({super.key});

  @override
  State<ResourceList> createState() => _ResourceListState();
}

class _ResourceListState extends State<ResourceList> {
  void buttonFunction() {
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(
              top: 15, left: 15), // Add 5 units of margin (top: 15, left: 15)
          child: CircleAvatar(
            backgroundColor: Color(0xFF484848),
            child: BackButton(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          child: Row(
            children: [
              Expanded(
                child: Image.asset(
                  'asset/hero.png',
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100.0),
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.start, // Align content from top
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        const Text(
                          'MEP Berhan Driving Licence School', // Add the title
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF484848)),
                        ),
                        SizedBox(
                            height:
                                120), // Add spacing between the title and other elements
                        LoginButton(
                          buttonName: "ESSENTIAL DOCUMENTS",
                          onPressed: buttonFunction,
                        ),
                        SizedBox(height: 20),
                        LoginButton(
                          buttonName: "SAFTEY AND YOUR YOUR VEICHLE",
                          onPressed: buttonFunction,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        LoginButton(
                          buttonName: "ROAD AND TRAFFIC SIGN",
                          onPressed: buttonFunction,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        LoginButton(
                          buttonName: "MOTORWAY RULES",
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
