import 'dart:ui';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mep/Data/Model/Question.dart';
import 'package:mep/View/Questions/QuestionsPage.dart';

part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  int qnum = 0;
  int index = 0;
  int mark = 0;
  dynamic mockQuestion = [];
  dynamic mockQuestionBackup = [];
  List<dynamic> selectedQuestions = [];

  Future<void> readCSV() async {
    final String csvDataCommunication =
        await rootBundle.loadString('asset/communication.csv');
    final String csvDataLandP =
        await rootBundle.loadString('asset/driving.csv');
    final String csvDataDriving =
        await rootBundle.loadString('asset/l_and_p.csv');

    final List<List<dynamic>> rows = [];

    rows.addAll(const CsvToListConverter().convert(csvDataCommunication));

    rows.addAll(const CsvToListConverter().convert(csvDataLandP));

    rows.addAll(const CsvToListConverter().convert(csvDataDriving));

    for (final row in rows) {
      var question = Question(
        id: 1,
        questionContent: row[1],
        choice1: row[2],
        choice2: row[3],
        choice3: row[4] ?? "null",
        choice4: row[5] ?? "null",
        choice5: row[6] ?? "null",
        answer: row[7],
        topic: "Communication",
      );
      mockQuestion.add(question);
    }
    mockQuestion.shuffle();
    int numQuestionsToSelect = min(50, mockQuestion.length);
    selectedQuestions = mockQuestion.sublist(0, numQuestionsToSelect);
    for (final row in selectedQuestions) {
      row.id = qnum += 1;
    }
    qnum = 0;
  }

  QuestionBloc() : super(QuestionInitialState()) {
    on<GetQuestions>((event, emit) async {
      emit(QuestionLoadingState());
      await readCSV();
      index = mark = 0;
      mockQuestion = [];
      mockQuestionBackup = [];
      mockQuestionBackup = mockQuestion;
      emit(QuestionSuccessState(question: selectedQuestions));
    });

    on<ChooseAnswer>((event, emit) async {
      emit(QuestionLoadingState());
      if (selectedQuestions[index].answer == event.choiceContent[0]) {
        mark++;
      }

      if (lastQuestion(index, selectedQuestions.length - 1) || timeUp) {
        timeUp = false;
        final String comment;
        final Color scoreColor;
        mockQuestion = [];
        mockQuestionBackup = [];
        mockQuestionBackup = mockQuestion;
        if (mark < (50 - (50 / 4))) {
          comment = "ባሁኑ ኣላለፉም ለ ቀጣይ መልካም እድል";
          scoreColor = Colors.red;
        } else {
          comment = "እንኳን ደስ አሎት ፈተናወን በሚገባ አልፈዋል";
          scoreColor = Colors.green;
        }

        emit(QuestionDoneState(
            mark, mockQuestionBackup.length, comment, scoreColor));
      } else {
        index++;
        emit(QuestionSuccessState(
            question: selectedQuestions, index: index, score: mark));
      }
    });

    on<SkipQuestion>((event, emit) async {
      emit(QuestionLoadingState());
      var skipped_question = selectedQuestions[index];
      selectedQuestions.add(skipped_question);
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
