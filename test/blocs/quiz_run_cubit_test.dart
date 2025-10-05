import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_master/features/quiz/domain/entity/question.dart';
import 'package:quiz_master/features/quiz/presentation/blocs/quiz_run/quiz_run_cubit.dart';

void main() {
  group('QuizRunCubit', () {
    late List<Question> questions;

    setUp(() {
      questions = [
        Question(
          category: 'General',
          type: 'multiple',
          difficulty: 'easy',
          question: 'Q1',
          correctAnswer: 'A1',
          incorrectAnswers: ['A2', 'A3', 'A4'],
        ),
        Question(
          category: 'General',
          type: 'multiple',
          difficulty: 'easy',
          question: 'Q2',
          correctAnswer: 'B1',
          incorrectAnswers: ['B2', 'B3', 'B4'],
        ),
      ];
    });

    test('initial state has correct values', () {
      final cubit = QuizRunCubit(questions, 20);
      expect(cubit.state.questions, questions);
      expect(cubit.state.currentIndex, 0);
      expect(cubit.state.score, 0);
      expect(cubit.state.timeLeft, 20);
      cubit.close();
    });

    test('timer counts down and calls nextQuestion automatically', () {
      fakeAsync((async) {
        final cubit = QuizRunCubit(questions, 3);

        expect(cubit.state.timeLeft, 3);

        async.elapse(const Duration(seconds: 1));
        expect(cubit.state.timeLeft, 2);

        async.elapse(const Duration(seconds: 2));
        expect(cubit.state.currentIndex, 1);
        expect(cubit.state.timeLeft, 3);

        cubit.close();
      });
    });

    test('answer correct increments score and locks question', () {
      fakeAsync((async) {
        final cubit = QuizRunCubit(questions, 20);

        cubit.answer('A1');
        expect(cubit.state.score, 1);
        expect(cubit.state.isLocked, true);
        expect(cubit.state.selectedAnswer, 'A1');

        async.elapse(const Duration(seconds: 1));
        expect(cubit.state.currentIndex, 1);
        expect(cubit.state.isLocked, false);

        cubit.close();
      });
    });

    test('answer incorrect does not increment score', () {
      fakeAsync((async) {
        final cubit = QuizRunCubit(questions, 20);

        cubit.answer('Wrong');
        expect(cubit.state.score, 0);
        expect(cubit.state.isLocked, true);

        async.elapse(const Duration(seconds: 1));
        expect(cubit.state.currentIndex, 1);

        cubit.close();
      });
    });

    test('useFiftyFifty disables two incorrect answers', () {
      final cubit = QuizRunCubit(questions, 20);

      expect(cubit.state.lifelineFiftyFiftyAvailable, true);
      cubit.useFiftyFifty();
      expect(cubit.state.lifelineFiftyFiftyAvailable, false);
      expect(cubit.state.disabledAnswers.length, 2);
      cubit.close();
    });

    test('useSkip skips to next question', () {
      fakeAsync((async) {
        final cubit = QuizRunCubit(questions, 20);

        expect(cubit.state.currentIndex, 0);
        expect(cubit.state.lifelineSkipAvailable, true);

        cubit.useSkip();
        expect(cubit.state.lifelineSkipAvailable, false);

        async.elapse(const Duration(seconds: 0));
        expect(cubit.state.currentIndex, 1);

        cubit.close();
      });
    });

    test('finishing last question shows results', () {
      fakeAsync((async) {
        final cubit = QuizRunCubit(questions, 1);

        cubit.answer('A1');
        async.elapse(const Duration(seconds: 1));
        cubit.answer('B1');
        async.elapse(const Duration(seconds: 1));

        expect(cubit.state.showResults, true);
        cubit.close();
      });
    });
  });
}
