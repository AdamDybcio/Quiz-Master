import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_master/features/quiz/domain/entity/question.dart';
import 'package:quiz_master/features/quiz/presentation/blocs/quiz_run/quiz_run_state.dart';

class QuizRunCubit extends Cubit<QuizRunState> {
  Timer? _timer;
  int _questionStartTime = 30;

  QuizRunCubit(List<Question> questions)
    : super(QuizRunState(questions: questions)) {
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    emit(state.copyWith(timeLeft: 30));
    _questionStartTime = 30;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timeLeft > 1) {
        emit(
          state.copyWith(
            timeLeft: state.timeLeft - 1,
            totalElapsedTime:
                state.totalElapsedTime + const Duration(seconds: 1),
          ),
        );
      } else {
        _recordAnswerTime();
        _timer?.cancel();
        nextQuestion();
      }
    });
  }

  void _recordAnswerTime() {
    final elapsedForThisQ = _questionStartTime - state.timeLeft;
    final updatedTimes = List<int>.from(state.answerTimes)
      ..add(elapsedForThisQ);
    emit(state.copyWith(answerTimes: updatedTimes));
  }

  void answer(String answer) {
    final q = state.questions[state.currentIndex];
    final isCorrect = answer == q.correctAnswer;

    final updatedAnswers = List<String?>.from(state.userAnswers);
    if (updatedAnswers.length < state.questions.length) {
      updatedAnswers.addAll(
        List<String?>.filled(
          state.questions.length - updatedAnswers.length,
          null,
        ),
      );
    }
    updatedAnswers[state.currentIndex] = answer;

    _recordAnswerTime();

    emit(
      state.copyWith(
        score: isCorrect ? state.score + 1 : state.score,
        userAnswers: updatedAnswers,
      ),
    );

    nextQuestion();
  }

  void nextQuestion() {
    if (state.currentIndex < state.questions.length - 1) {
      emit(
        state.copyWith(
          currentIndex: state.currentIndex + 1,
          disabledAnswers: [],
        ),
      );
      _startTimer();
    } else {
      _timer?.cancel();
      emit(state.copyWith(showResults: true, disabledAnswers: []));
    }
  }

  void useFiftyFifty() {
    if (!state.lifelineFiftyFiftyAvailable) return;

    final question = state.questions[state.currentIndex];

    final incorrect = [...question.incorrectAnswers];
    incorrect.shuffle();

    final toDisable = incorrect.take(2).toList();

    emit(
      state.copyWith(
        lifelineFiftyFiftyAvailable: false,
        disabledAnswers: toDisable,
      ),
    );
  }

  void useSkip() {
    if (state.lifelineSkipAvailable) {
      emit(state.copyWith(lifelineSkipAvailable: false));
      nextQuestion();
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
