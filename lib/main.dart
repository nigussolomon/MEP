import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mep/Bloc/question/question_bloc.dart';
import 'package:mep/View/IntroPages/login.dart';
import 'package:mep/View/Questions/QuestionsPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 72, 72, 72)),
              fontFamily: 'AbyssinicaSIL-Regular',
              
          // useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
        );
        // home: BlocProvider<QuestionBloc>(
        //   create: (context) => QuestionBloc(),
        //   child: const QuestionPage(),
        // ));
  }
}
