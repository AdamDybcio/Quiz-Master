import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quiz_master/features/quiz/domain/entity/quiz_params.dart';
import 'package:quiz_master/features/quiz/domain/usecase/get_quiz.dart';
import 'package:quiz_master/features/quiz/domain/entity/question.dart';
import 'package:quiz_master/features/quiz/presentation/blocs/quiz/quiz_cubit.dart';

class MockGetQuiz extends Mock implements GetQuiz {}

class FakeQuizParams extends Fake implements QuizParams {}

void main() {
  late QuizCubit cubit;
  late MockGetQuiz mockGetQuiz;

  final sampleQuestions = [
    Question(
      category: 'General',
      type: 'multiple',
      difficulty: 'easy',
      question: 'Sample question 1?',
      correctAnswer: 'Answer 1',
      incorrectAnswers: ['Wrong 1', 'Wrong 2', 'Wrong 3'],
    ),
  ];

  setUpAll(() {
    registerFallbackValue(FakeQuizParams());
  });

  setUp(() {
    mockGetQuiz = MockGetQuiz();
    cubit = QuizCubit(getQuiz: mockGetQuiz);
  });

  group('QuizCubit Tests', () {
    test('initial state is QuizInitial', () {
      expect(cubit.state, isA<QuizInitial>());
    });

    test('loadQuiz emits QuizLoading then QuizLoaded on success', () async {
      when(() => mockGetQuiz(any())).thenAnswer((_) async => sampleQuestions);

      final future = expectLater(
        cubit.stream,
        emitsInOrder([
          isA<QuizLoading>(),
          isA<QuizLoaded>().having(
            (s) => s.questions,
            'questions',
            sampleQuestions,
          ),
        ]),
      );

      await cubit.loadQuiz(const QuizParams(amount: 1));

      await future;
    });

    test('loadQuiz emits QuizLoading then QuizError on failure', () async {
      when(() => mockGetQuiz(any())).thenThrow(Exception('Failed'));

      final future = expectLater(
        cubit.stream,
        emitsInOrder([
          isA<QuizLoading>(),
          isA<QuizError>().having(
            (s) => s.message,
            'message',
            contains('Failed'),
          ),
        ]),
      );

      await cubit.loadQuiz(const QuizParams(amount: 1));

      await future;

      verify(() => mockGetQuiz(any())).called(1);
    });
  });
}
