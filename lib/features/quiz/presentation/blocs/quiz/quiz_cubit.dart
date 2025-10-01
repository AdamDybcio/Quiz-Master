import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_master/features/quiz/domain/entity/question.dart';
import 'package:quiz_master/features/quiz/domain/entity/quiz_params.dart';
import 'package:quiz_master/features/quiz/domain/usecase/get_quiz.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  final GetQuiz getQuiz;

  QuizCubit({required this.getQuiz}) : super(QuizInitial());

  Future<void> loadQuiz(QuizParams params) async {
    emit(QuizLoading());
    try {
      final questions = await getQuiz(params);
      emit(QuizLoaded(questions));
    } catch (e) {
      emit(QuizError(e.toString()));
    }
  }
}
