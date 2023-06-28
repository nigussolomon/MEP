part of 'question_bloc.dart';

abstract class QuestionEvent extends Equatable {}

class GetQuestions extends QuestionEvent {
  @override
  List<Object> get props => [];
}
