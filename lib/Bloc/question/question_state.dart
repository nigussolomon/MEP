part of 'question_bloc.dart';

abstract class QuestionState extends Equatable {}

class QuestionInitialState extends QuestionState {
  @override
  List<Object> get props => [];
}

class QuestionLoadingState extends QuestionState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class QuestionSuccessState extends QuestionState {
  final List? question;
  int index;

  QuestionSuccessState({this.question, this.index = 0});
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class QuestionFailState extends QuestionState {
  String message =
      "Failed to display questions, \nMake sure you are connected to the internet";

  QuestionFailState(this.message);

  @override
  List<Object> get props => [];
}

class QuestionDoneState extends QuestionState {
  final int score;
  final int total;
  final String comment;
  final Color scoreColor;

  QuestionDoneState(this.score, this.total, this.comment, this.scoreColor);
  @override
  List<Object> get props => [];
}
