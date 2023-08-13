part of 'question_bloc.dart';

abstract class QuestionEvent extends Equatable {}

class GetQuestions extends QuestionEvent {
  @override
  List<Object> get props => [];
}

class ChooseAnswer extends QuestionEvent {
  final String choiceContent;

  ChooseAnswer(this.choiceContent);
  @override
  List<Object> get props => [];
}

class SkipQuestion extends QuestionEvent {
  @override
  List<Object> get props => [];
}

class ForceQuit extends QuestionEvent {
  @override
  List<Object> get props => [];
}
