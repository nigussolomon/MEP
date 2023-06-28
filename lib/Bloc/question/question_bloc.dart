import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mep/Service/ApiService.dart';

part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  final _apiServiceProvider = ApiServiceProvider();

  QuestionBloc() : super(QuestionInitialState()) {
    on<GetQuestions>((event, emit) async {
      emit(QuestionLoadingState());
      dynamic apiQuestion = await _apiServiceProvider.fetchQuestion();
      emit(QuestionSuccessState(apiQuestion));
    });
  }
}
