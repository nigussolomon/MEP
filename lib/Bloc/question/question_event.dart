part of 'question_bloc.dart';

abstract class QuestionEvent extends Equatable {}

class GetQuestions extends QuestionEvent {
  final int cdc;
  final int cdlp;
  final int cdt;
  final int cdd;
  final int cde;

  GetQuestions(
    this.cdc,
    this.cdlp,
    this.cdt,
    this.cdd,
    this.cde,
  );
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
