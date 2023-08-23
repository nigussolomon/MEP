import 'dart:typed_data';
import 'dart:ui';
import 'dart:io';
import 'dart:math';
import 'package:path/path.dart' as path;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mep/Data/Model/Question.dart';
import 'package:mep/View/Questions/QuestionsPage.dart';
import 'package:excel/excel.dart';

part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  int index = 0;
  int mark = 0;
  int numOfQ = 0;
  dynamic mockQuestion = [];
  dynamic mockQuestionBackup = [];
  List<dynamic> selectedQuestions = [];

  QuestionBloc() : super(QuestionInitialState()) {
    on<GetQuestions>((event, emit) async {
      var assetPath = "asset/questions.xlsx";
      var filePath = path.join(path.current, assetPath);
      var file = File(filePath);
      var bytes = file.readAsBytesSync();
      var excel = Excel.decodeBytes(Uint8List.fromList(bytes));
      var table1 = excel.tables['driving'];
      var table2 = excel.tables['communication'];
      table1!.rows.removeAt(0);
      table2!.rows.removeAt(0);
      var table = table1.rows + table2.rows;

      for (var row in table) {
        if (row[0] != null) {
          var question = Question(
            id: 1,
            questionContent: row[1].toString().split(', ')[0].substring(5),
            choice1: row[2].toString().split(', ')[0].substring(5),
            choice2: row[3].toString().split(', ')[0].substring(5),
            choice3: row[4].toString().split(', ').length > 2
                ? row[4].toString().split(', ')[0].substring(5)
                : "null",
            choice4: row[5].toString().split(', ').length > 2
                ? row[5].toString().split(', ')[0].substring(5)
                : "null",
            choice5: row[6].toString().split(', ').length > 2
                ? row[6].toString().split(', ')[0].substring(5)
                : "null",
            answer: row[7].toString().split(', ')[0].substring(5),
            topic: "Communication",
          );
          mockQuestion.add(question);
        }
      }
      mockQuestion.shuffle();
      int numQuestionsToSelect = min(50, mockQuestion.length);
      selectedQuestions = mockQuestion.sublist(0, numQuestionsToSelect);
      emit(QuestionLoadingState());
      index = mark = 0;
      mockQuestionBackup = [];
      mockQuestionBackup = selectedQuestions;
      numOfQ = selectedQuestions.length;
      emit(QuestionSuccessState(question: selectedQuestions));
    });

    on<ChooseAnswer>((event, emit) async {
      emit(QuestionLoadingState());

      //marking code goes here......
      if (selectedQuestions[index].answer ==
          event.choiceContent.split('.')[0]) {
        mark++;
      }

      if (lastQuestion(index, selectedQuestions.length - 1) || timeUp) {
        //revert timer
        timeUp = false;

        final String comment;
        final Color scoreColor;
        //...
        if (mark < (numOfQ / 2)) {
          comment = "ባሁኑ ኣላለፉም ለ ቀጣይ መልካም እድል";
          scoreColor = Colors.red;
        } else {
          comment = "እንኳን ደስ አሎት ፈተናወን በሚገባ አልፈዋል";
          scoreColor = Colors.green;
        }

        emit(QuestionDoneState(mark, numOfQ, comment, scoreColor));
      } else {
        index++;
        emit(QuestionSuccessState(question: selectedQuestions, index: index));
      }
    });

    on<SkipQuestion>((event, emit) async {
      emit(QuestionLoadingState());
      //...
      var skipped_question = selectedQuestions[index];

      //substitute....
      selectedQuestions.add(skipped_question);

      //update index
      index++;

      emit(QuestionSuccessState(question: selectedQuestions, index: index));
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
