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

class QuestionSuccessState extends QuestionState {
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
