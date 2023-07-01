import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mep/Data/Model/Question.dart';
import 'package:mep/Service/ApiService.dart';

part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  final _apiServiceProvider = ApiServiceProvider();
  int index = 0;
  int mark = 0;
  dynamic mockQuestion = [];
  dynamic mockQuestionBackup = [];

  QuestionBloc() : super(QuestionInitialState()) {
    var question1 = Question(
        id: 1,
        questionContent: "አንድን መረጃ ለማሰባሰብና ለማዘጋጀት ቀላልና ርካሽ የሆነው የቱ ነው?",
        choice1: "ማስታወሻ ደብተር",
        choice2: "ቪዲዮ ካሜራ",
        choice3: "የድምፅ መቅረጫ ቴፕሪከርደር",
        choice4: "ሁሉም",
        answer: "ሁሉም",
        topic: "የጉዞ መረጃ አሰባሰብ");
    var question2 = Question(
        id: 2,
        questionContent: "የጉዞ መረጃዎችን ለማግኘት ከሚከተሉት ውስጥ ወደ የትኛው መ/ቤት መሄድ ይመረጣል?",
        choice1: "ባንክና ኢንሹራንስ",
        choice2: "ንግድና ኢንዱስትሪ ቢሮ",
        choice3: "ጤና ወይም ትምህርት ቢሮ",
        choice4: "መንገዶችና ትራንስፖርት ቢሮ",
        answer: "ጤና ወይም ትምህርት ቢሮ",
        topic: "የጉዞ መረጃ አሰባሰብ");
    var question3 = Question(
        id: 3,
        questionContent:
            "ለአንድ አሽከርካሪ የጉዞ መረጃን ለማሰባሰብ ከሚከተሉት ውስጥ ጠቀሜታ የሌለው የቱ ነው?",
        choice1: "አካባቢውን (መንገዱን) ከሚያውቁት ጋር መወያየት",
        choice2: "ስለ መንገዱ በፅሁፍ የተዘጋጀን መረጃ ማንበብ",
        choice3: "የሕዝቡ ቁጥር ስንት እንደሆነ ማወቅ",
        choice4: "የመንገዱን ካርታ ማወቅ",
        answer: "ስለ መንገዱ በፅሁፍ የተዘጋጀን መረጃ ማንበብ",
        topic: "የጉዞ መረጃ አሰባሰብ");
    var question4 = Question(
        id: 4,
        questionContent: "አንድ አሽከርካሪ ለጉዞው መያዝ ያለበት ጠቃሚ የመረጃ አይነት የሆነው የቱ ነው?",
        choice1: "የይለፍ ወረቀት",
        choice2: "የጭነት ማዘዣ ወረቀት",
        choice3: "መንጃ ፍቃድ",
        choice4: "ሁሉም መልስ ነው",
        answer: "ሁሉም መልስ ነው",
        topic: "የጉዞ መረጃ አሰባሰብ");
    mockQuestion.add(question1);
    mockQuestion.add(question2);
    mockQuestion.add(question3);
    mockQuestion.add(question4);

    //backing up
    mockQuestionBackup = mockQuestion;
    on<GetQuestions>((event, emit) async {
      emit(QuestionLoadingState());
      // dynamic apiQuestion = await _apiServiceProvider.fetchQuestion();
      index = mark = 0;
      emit(QuestionSuccessState(question: mockQuestion));
    });

    on<ChooseAnswer>((event, emit) async {
      emit(QuestionLoadingState());

      //marking code goes here......
      if (mockQuestion[index].answer == event.choiceContent) {
        mark++;
      }

      if (lastQuestion(index, mockQuestion.length - 1)) {
        final String comment;
        final Color scoreColor;
        if (mark < (mockQuestionBackup.length / 2)) {
          comment = "Better luck next time";
          scoreColor = Colors.red;
        } else {
          comment = "Welldone";
          scoreColor = Colors.green;
        }
        emit(QuestionDoneState(
            mark, mockQuestionBackup.length, comment, scoreColor));
      } else {
        index++;
        emit(QuestionSuccessState(question: mockQuestion, index: index));
      }
    });

    on<SkipQuestion>((event, emit) async {
      emit(QuestionLoadingState());
      //...
      var skipped_question = mockQuestion[index];

      //substitute....
      mockQuestion.add(skipped_question);

      //update index
      index++;

      emit(QuestionSuccessState(question: mockQuestion, index: index));
    });
  }
}

//custom functions
bool lastQuestion(int cur_index, int last_index) {
  if (cur_index == last_index) {
    return true;
  }
  return false;
}
